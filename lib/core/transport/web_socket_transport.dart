import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../api/api_constants.dart';
import '../models/events.dart';
import '../models/message.dart';
import '../models/session.dart';
import 'event_normalizer.dart';
import 'message_reducer.dart';

enum ConnectionState { disconnected, connecting, connected, reconnecting }

typedef SnapshotFetcher = Future<({SessionInfo info, List<StoredMessage> messages})> Function(String sessionId);
typedef TokenProvider = Future<String> Function();

class WebSocketTransport {
  final String _sessionId;
  final TokenProvider _getAuthToken;
  final SnapshotFetcher? _fetchSnapshot;
  final MessageReducer reducer;
  final void Function(ServiceEvent)? onServiceEvent;
  final void Function(String)? onError;
  final void Function(ConnectionState)? onConnectionStateChanged;

  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  String _authToken = '';
  int _generation = 0;
  String? _ownerConnectionId;
  bool _sessionStopped = false;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  ConnectionState _connectionState = ConnectionState.disconnected;

  static const _commandTimeout = Duration(seconds: 30);
  static const _maxReconnectDelay = Duration(seconds: 30);
  static const _uuid = Uuid();

  final Map<String, _PendingCommand> _pendingCommands = {};

  WebSocketTransport({
    required String sessionId,
    required TokenProvider getAuthToken,
    SnapshotFetcher? fetchSnapshot,
    MessageReducer? reducer,
    this.onServiceEvent,
    this.onError,
    this.onConnectionStateChanged,
  })  : _sessionId = sessionId,
        _getAuthToken = getAuthToken,
        _fetchSnapshot = fetchSnapshot,
        reducer = reducer ?? MessageReducer();

  ConnectionState get connectionState => _connectionState;

  Future<void> connect() async {
    _generation++;
    final gen = _generation;
    _cleanup();
    _setConnectionState(ConnectionState.connecting);

    try {
      _authToken = await _getAuthToken();
    } catch (e) {
      onError?.call('Failed to get auth token');
      _setConnectionState(ConnectionState.disconnected);
      return;
    }

    if (gen != _generation) return;

    // Fetch snapshot first if available
    if (_fetchSnapshot != null) {
      try {
        final snapshot = await _fetchSnapshot(_sessionId);
        if (gen != _generation) return;
        reducer.replaySnapshot(snapshot.info, snapshot.messages);
      } catch (e) {
        // Non-fatal — still connect for live events
      }
    }

    if (gen != _generation) return;
    _openWebSocket(gen);
  }

  void _openWebSocket(int expectedGen) {
    if (expectedGen != _generation) return;

    final uri = Uri.parse('${ApiConstants.wsUrl}?token=$_authToken');
    try {
      _channel = WebSocketChannel.connect(uri);
    } catch (e) {
      onError?.call('Failed to connect WebSocket');
      _scheduleReconnect(expectedGen);
      return;
    }

    _sessionStopped = false;
    _ownerConnectionId = null;

    _channel!.ready.then((_) {
      if (expectedGen != _generation) return;
      _setConnectionState(ConnectionState.connected);
      _reconnectAttempts = 0;
      _channel!.sink.add(jsonEncode({
        'type': 'subscribe',
        'sessionId': _sessionId,
      }));
    }).catchError((e) {
      if (expectedGen != _generation) return;
      _scheduleReconnect(expectedGen);
    });

    _subscription = _channel!.stream.listen(
      (data) {
        if (expectedGen != _generation) return;
        _handleRawMessage(data);
      },
      onError: (e) {
        if (expectedGen != _generation) return;
        _scheduleReconnect(expectedGen);
      },
      onDone: () {
        if (expectedGen != _generation) return;
        _scheduleReconnect(expectedGen);
      },
    );
  }

  void _handleRawMessage(dynamic raw) {
    if (raw is! String) return;
    final Map<String, dynamic> json;
    try {
      json = jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {
      return;
    }

    final type = json['type'] as String?;
    switch (type) {
      case 'event':
        _handleEventMessage(json);
      case 'system':
        _handleSystemMessage(json);
      case 'response':
        _handleResponseMessage(json);
    }
  }

  void _handleEventMessage(Map<String, dynamic> json) {
    final sessionId = json['sessionId'] as String?;
    final parentSessionId = json['parentSessionId'] as String?;
    final event = json['event'] as String?;
    final data = json['data'];

    if (event == null) return;
    if (sessionId != _sessionId && parentSessionId != _sessionId) return;

    final normalized = EventNormalizer.normalize(event, data);
    if (normalized == null) return;

    if (normalized is ChatEvent) {
      reducer.onEvent(normalized);
    } else if (normalized is ServiceEvent) {
      onServiceEvent?.call(normalized);
    }
  }

  void _handleSystemMessage(Map<String, dynamic> json) {
    final event = json['event'] as String?;
    final data = json['data'];

    if (event == 'cli.disconnected') {
      final parsed = data is Map<String, dynamic> ? data : <String, dynamic>{};
      final disconnectedId = parsed['connectionId'] as String?;
      if (_ownerConnectionId == null || disconnectedId == _ownerConnectionId) {
        if (!_sessionStopped) {
          onServiceEvent?.call(const ServiceEvent.stopped(reason: 'disconnected'));
          _sessionStopped = true;
        }
      }
      return;
    }

    if (event == 'sessions.heartbeat' || event == 'sessions.list') {
      if (data is! Map<String, dynamic>) return;
      final connectionId = data['connectionId'] as String?;
      final sessions = data['sessions'] as List?;
      if (connectionId == null || sessions == null) return;

      final found = sessions.any((s) =>
          s is Map<String, dynamic> && s['id'] == _sessionId);
      if (found) {
        _ownerConnectionId = connectionId;
        return;
      }

      final isOwner = _ownerConnectionId == null || connectionId == _ownerConnectionId;
      if (isOwner && !_sessionStopped) {
        onServiceEvent?.call(const ServiceEvent.stopped(reason: 'disconnected'));
        _sessionStopped = true;
      }
    }
  }

  void _handleResponseMessage(Map<String, dynamic> json) {
    final id = json['id'] as String?;
    if (id == null) return;
    final pending = _pendingCommands.remove(id);
    if (pending == null) return;
    pending.timer.cancel();

    final error = json['error'];
    if (error != null) {
      pending.completer.completeError(
        Exception(error is String ? error : 'Command failed'),
      );
    } else {
      pending.completer.complete(json['result']);
    }
  }

  Future<dynamic> sendCommand(String command, Map<String, dynamic> data) {
    if (_channel == null || _connectionState != ConnectionState.connected) {
      return Future.error(Exception('WebSocket is not connected'));
    }

    final id = _uuid.v4();
    final completer = Completer<dynamic>();
    final timer = Timer(_commandTimeout, () {
      _pendingCommands.remove(id);
      if (!completer.isCompleted) {
        completer.completeError(Exception('Command timed out'));
      }
    });

    _pendingCommands[id] = _PendingCommand(completer: completer, timer: timer);

    _channel!.sink.add(jsonEncode({
      'type': 'command',
      'id': id,
      'command': command,
      'sessionId': _sessionId,
      'data': data,
    }));

    return completer.future;
  }

  Future<void> sendMessage(String text, {String? mode, String? model}) {
    return sendCommand('send_message', {
      'sessionID': _sessionId,
      'parts': [{'type': 'text', 'text': text}],
      if (mode != null) 'agent': mode,
      if (model != null) 'model': model,
    });
  }

  Future<void> interrupt() => sendCommand('interrupt', {});

  Future<void> respondToPermission(String requestId, String response) {
    return sendCommand('permission_respond', {
      'requestID': requestId,
      'reply': response,
    });
  }

  Future<void> answerQuestion(String requestId, List<List<String>> answers) {
    return sendCommand('question_reply', {
      'requestID': requestId,
      'answers': answers,
    });
  }

  Future<void> rejectQuestion(String requestId) {
    return sendCommand('question_reject', {
      'requestID': requestId,
    });
  }

  void disconnect() {
    _generation++;
    _cancelPendingCommands();

    if (_channel != null && _connectionState == ConnectionState.connected) {
      _channel!.sink.add(jsonEncode({
        'type': 'unsubscribe',
        'sessionId': _sessionId,
      }));
    }

    _cleanup();
    _setConnectionState(ConnectionState.disconnected);
  }

  void _cleanup() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _subscription?.cancel();
    _subscription = null;
    _channel?.sink.close();
    _channel = null;
  }

  void _cancelPendingCommands() {
    for (final entry in _pendingCommands.values) {
      entry.timer.cancel();
      if (!entry.completer.isCompleted) {
        entry.completer.completeError(Exception('Transport disconnected'));
      }
    }
    _pendingCommands.clear();
  }

  void _scheduleReconnect(int expectedGen) {
    _cleanup();
    _setConnectionState(ConnectionState.reconnecting);
    _reconnectAttempts++;

    final delayMs = min(
      1000 * pow(2, _reconnectAttempts - 1).toInt(),
      _maxReconnectDelay.inMilliseconds,
    );

    _reconnectTimer = Timer(Duration(milliseconds: delayMs), () {
      if (expectedGen != _generation) return;
      _openWebSocket(expectedGen);

      // Replay snapshot on reconnect
      if (_fetchSnapshot != null) {
        _fetchSnapshot(_sessionId).then((snapshot) {
          if (expectedGen != _generation) return;
          reducer.replaySnapshot(snapshot.info, snapshot.messages);
        }).catchError((_) {});
      }
    });
  }

  void _setConnectionState(ConnectionState state) {
    _connectionState = state;
    onConnectionStateChanged?.call(state);
  }
}

class _PendingCommand {
  final Completer<dynamic> completer;
  final Timer timer;

  _PendingCommand({required this.completer, required this.timer});
}
