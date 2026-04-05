import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/events.dart';
import '../../../core/models/message.dart';
import '../../../core/models/permission.dart';
import '../../../core/models/question.dart';
import '../../../core/transport/web_socket_transport.dart';
import '../../auth/providers/auth_provider.dart';
import '../../sessions/providers/sessions_provider.dart';

final sessionNotifierProvider = AsyncNotifierProvider.family<SessionNotifier,
    SessionState, String>(SessionNotifier.new);

/// How many messages to show initially and per "load more" batch.
const _pageSize = 30;

class SessionState {
  /// The visible window of messages (last N from the full list).
  final List<StoredMessage> messages;
  final ConnectionState connectionState;
  final bool isStreaming;
  final PermissionRequest? activePermission;
  final QuestionRequest? activeQuestion;
  final String? error;

  /// True when there are older messages that haven't been exposed yet.
  final bool hasMore;

  const SessionState({
    this.messages = const [],
    this.connectionState = ConnectionState.disconnected,
    this.isStreaming = false,
    this.activePermission,
    this.activeQuestion,
    this.error,
    this.hasMore = false,
  });

  SessionState copyWith({
    List<StoredMessage>? messages,
    ConnectionState? connectionState,
    bool? isStreaming,
    PermissionRequest? activePermission,
    bool clearPermission = false,
    QuestionRequest? activeQuestion,
    bool clearQuestion = false,
    String? error,
    bool clearError = false,
    bool? hasMore,
  }) {
    return SessionState(
      messages: messages ?? this.messages,
      connectionState: connectionState ?? this.connectionState,
      isStreaming: isStreaming ?? this.isStreaming,
      activePermission:
          clearPermission ? null : (activePermission ?? this.activePermission),
      activeQuestion:
          clearQuestion ? null : (activeQuestion ?? this.activeQuestion),
      error: clearError ? null : (error ?? this.error),
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class SessionNotifier extends FamilyAsyncNotifier<SessionState, String> {
  WebSocketTransport? _transport;

  /// How many messages from the tail of the full list are currently visible.
  int _visibleCount = _pageSize;

  @override
  Future<SessionState> build(String arg) async {
    final sessionId = arg;
    ref.onDispose(() {
      _transport?.reset();
      _transport?.disconnect();
    });

    final tokenAsync = ref.watch(authProvider);
    final token = tokenAsync.valueOrNull;
    if (token == null) return const SessionState();

    final apiClient = ref.read(apiClientProvider);

    _transport = WebSocketTransport(
      sessionId: sessionId,
      getAuthToken: () => apiClient.getToken(),
      fetchSnapshot: (id) => apiClient.getSessionMessages(id),
      onServiceEvent: _handleServiceEvent,
      onMessagesChanged: _syncMessages,
      onError: (msg) {
        final current = state.valueOrNull ?? const SessionState();
        state = AsyncData(current.copyWith(error: msg));
      },
      onConnectionStateChanged: (cs) {
        final current = state.valueOrNull ?? const SessionState();
        state = AsyncData(current.copyWith(connectionState: cs));
      },
    );

    _transport!.reducer.clear();
    _visibleCount = _pageSize;
    await _transport!.connect();

    if (_transport == null) return const SessionState();

    return _buildState();
  }

  /// Slices the tail of the full message list based on [_visibleCount].
  SessionState _buildState([SessionState? base]) {
    final all = _transport!.reducer.messages;
    final total = all.length;
    final start = max(0, total - _visibleCount);
    return (base ?? state.valueOrNull ?? const SessionState()).copyWith(
      messages: start == 0 ? all : all.sublist(start),
      hasMore: start > 0,
    );
  }

  /// Expose the next page of older messages.
  void loadMore() {
    final all = _transport?.reducer.messages;
    if (all == null) return;
    if (_visibleCount >= all.length) return; // nothing to load
    _visibleCount = min(_visibleCount + _pageSize, all.length);
    state = AsyncData(_buildState());
  }

  void _handleServiceEvent(ServiceEvent event) {
    final current = state.valueOrNull ?? const SessionState();
    // When new messages arrive via events, keep the window anchored to the tail.
    _visibleCount = max(_visibleCount, _pageSize);
    switch (event) {
      case SessionStatusEvent(:final status):
        final type = status['type'] as String?;
        state = AsyncData(_buildState(current.copyWith(
          isStreaming: type == 'busy',
        )));
      case PermissionAskedEvent(
          :final requestId,
          :final permission,
          :final patterns,
          :final metadata,
          :final always,
        ):
        state = AsyncData(_buildState(current.copyWith(
          activePermission: PermissionRequest(
            requestId: requestId,
            permission: permission,
            patterns: patterns,
            metadata: metadata,
            always: always,
          ),
        )));
      case PermissionRepliedEvent(:final requestId):
        if (current.activePermission?.requestId == requestId) {
          state = AsyncData(_buildState(current.copyWith(
            clearPermission: true,
          )));
        }
      case QuestionAskedEvent(:final requestId, :final questions):
        state = AsyncData(_buildState(current.copyWith(
          activeQuestion: QuestionRequest(
            requestId: requestId,
            questions: questions
                    ?.map((q) => QuestionInfo.fromJson(q))
                    .toList() ??
                [],
          ),
        )));
      case QuestionRepliedEvent(:final requestId):
        if (current.activeQuestion?.requestId == requestId) {
          state = AsyncData(_buildState(current.copyWith(
            clearQuestion: true,
          )));
        }
      case StoppedEvent(:final reason):
        state = AsyncData(_buildState(current.copyWith(
          isStreaming: false,
          error: reason == 'disconnected' ? 'CLI disconnected' : null,
        )));
      case SessionErrorEvent(:final error):
        state = AsyncData(_buildState(current.copyWith(error: error)));
      case SessionCreatedEvent():
        state = AsyncData(_buildState());
    }
  }

  void _syncMessages() {
    // New live message arrived — always include it (expand window if needed).
    final all = _transport?.reducer.messages;
    if (all != null && _visibleCount < all.length) {
      // A new message appeared at the tail; grow the window to include it.
      _visibleCount = _visibleCount + (all.length - _visibleCount);
    }
    state = AsyncData(_buildState());
  }

  Future<void> sendMessage(String text, {String? mode, String? model}) async {
    await _transport?.sendMessage(text, mode: mode, model: model);
    _syncMessages();
  }

  Future<void> interrupt() async {
    await _transport?.interrupt();
  }

  Future<void> respondToPermission(String requestId, String response) async {
    await _transport?.respondToPermission(requestId, response);
  }

  Future<void> answerQuestion(
      String requestId, List<List<String>> answers) async {
    await _transport?.answerQuestion(requestId, answers);
  }

  Future<void> rejectQuestion(String requestId) async {
    await _transport?.rejectQuestion(requestId);
  }

  void clearError() {
    final current = state.valueOrNull ?? const SessionState();
    state = AsyncData(current.copyWith(clearError: true));
  }
}
