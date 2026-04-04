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

class SessionState {
  final List<StoredMessage> messages;
  final ConnectionState connectionState;
  final bool isStreaming;
  final PermissionRequest? activePermission;
  final QuestionRequest? activeQuestion;
  final String? error;

  const SessionState({
    this.messages = const [],
    this.connectionState = ConnectionState.disconnected,
    this.isStreaming = false,
    this.activePermission,
    this.activeQuestion,
    this.error,
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
    );
  }
}

class SessionNotifier extends FamilyAsyncNotifier<SessionState, String> {
  WebSocketTransport? _transport;

  @override
  Future<SessionState> build(String arg) async {
    final sessionId = arg;
    ref.onDispose(() => _transport?.disconnect());

    final tokenAsync = ref.watch(authProvider);
    final token = tokenAsync.valueOrNull;
    if (token == null) return const SessionState();

    final apiClient = ref.read(apiClientProvider);

    _transport = WebSocketTransport(
      sessionId: sessionId,
      getAuthToken: () => apiClient.getToken(),
      fetchSnapshot: (id) => apiClient.getSessionMessages(id),
      onServiceEvent: _handleServiceEvent,
      onError: (msg) {
        final current = state.valueOrNull ?? const SessionState();
        state = AsyncData(current.copyWith(error: msg));
      },
      onConnectionStateChanged: (cs) {
        final current = state.valueOrNull ?? const SessionState();
        state = AsyncData(current.copyWith(connectionState: cs));
      },
    );

    // Listen to reducer changes
    // We'll poll the reducer messages on each event
    await _transport!.connect();

    return SessionState(
      messages: _transport!.reducer.messages,
      connectionState: _transport!.connectionState,
    );
  }

  void _handleServiceEvent(ServiceEvent event) {
    final current = state.valueOrNull ?? const SessionState();
    switch (event) {
      case SessionStatusEvent(:final status):
        final type = status['type'] as String?;
        state = AsyncData(current.copyWith(
          isStreaming: type == 'busy',
          messages: _transport!.reducer.messages,
        ));
      case PermissionAskedEvent(
          :final requestId,
          :final permission,
          :final patterns,
          :final metadata,
          :final always,
        ):
        state = AsyncData(current.copyWith(
          activePermission: PermissionRequest(
            requestId: requestId,
            permission: permission,
            patterns: patterns,
            metadata: metadata,
            always: always,
          ),
          messages: _transport!.reducer.messages,
        ));
      case PermissionRepliedEvent(:final requestId):
        if (current.activePermission?.requestId == requestId) {
          state = AsyncData(current.copyWith(
            clearPermission: true,
            messages: _transport!.reducer.messages,
          ));
        }
      case QuestionAskedEvent(:final requestId, :final questions):
        state = AsyncData(current.copyWith(
          activeQuestion: QuestionRequest(
            requestId: requestId,
            questions: questions
                    ?.map((q) => QuestionInfo.fromJson(q))
                    .toList() ??
                [],
          ),
          messages: _transport!.reducer.messages,
        ));
      case QuestionRepliedEvent(:final requestId):
        if (current.activeQuestion?.requestId == requestId) {
          state = AsyncData(current.copyWith(
            clearQuestion: true,
            messages: _transport!.reducer.messages,
          ));
        }
      case StoppedEvent(:final reason):
        state = AsyncData(current.copyWith(
          isStreaming: false,
          messages: _transport!.reducer.messages,
          error: reason == 'disconnected' ? 'CLI disconnected' : null,
        ));
      case SessionErrorEvent(:final error):
        state = AsyncData(current.copyWith(
          error: error,
          messages: _transport!.reducer.messages,
        ));
      case SessionCreatedEvent():
        state = AsyncData(current.copyWith(
          messages: _transport!.reducer.messages,
        ));
    }
  }

  /// Call this after reducer processes a ChatEvent to sync messages.
  void _syncMessages() {
    final current = state.valueOrNull ?? const SessionState();
    state = AsyncData(current.copyWith(
      messages: _transport!.reducer.messages,
    ));
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
