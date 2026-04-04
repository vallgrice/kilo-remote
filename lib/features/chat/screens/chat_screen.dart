import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/session_notifier.dart';
import '../widgets/message_list.dart';
import '../widgets/chat_input.dart';
import '../widgets/working_indicator.dart';
import '../widgets/permission_card.dart';
import '../widgets/question_card.dart';
import '../../../core/transport/web_socket_transport.dart' as transport;
import '../../../shared/theme/app_colors.dart';

class ChatScreen extends ConsumerWidget {
  final String sessionId;

  const ChatScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(sessionNotifierProvider(sessionId));

    return sessionAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('Session')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(title: const Text('Session')),
        body: Center(child: Text('Error: $e', style: const TextStyle(color: AppColors.error))),
      ),
      data: (state) {
        final notifier = ref.read(sessionNotifierProvider(sessionId).notifier);
        final isConnected = state.connectionState == transport.ConnectionState.connected;
        final canSend = isConnected && !state.isStreaming;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Remote Session'),
            actions: [
              // Connection indicator
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.circle,
                  size: 10,
                  color: isConnected ? AppColors.success : AppColors.error,
                ),
              ),
              // Interrupt button
              if (state.isStreaming)
                IconButton(
                  onPressed: () => notifier.interrupt(),
                  icon: const Icon(Icons.stop_circle, color: AppColors.error),
                  tooltip: 'Interrupt',
                ),
            ],
          ),
          body: Column(
            children: [
              // Error banner
              if (state.error != null)
                MaterialBanner(
                  content: Text(state.error!),
                  backgroundColor: AppColors.error.withOpacity(0.1),
                  actions: [
                    TextButton(
                      onPressed: () => notifier.clearError(),
                      child: const Text('Dismiss'),
                    ),
                  ],
                ),
              // Message list
              Expanded(
                child: MessageList(
                  messages: state.messages,
                  isStreaming: state.isStreaming,
                ),
              ),
              // Working indicator
              WorkingIndicator(
                messages: state.messages,
                isStreaming: state.isStreaming,
              ),
              // Permission dock
              if (state.activePermission != null)
                PermissionCardWidget(
                  permission: state.activePermission!,
                  onRespond: (id, response) => notifier.respondToPermission(id, response),
                ),
              // Question dock
              if (state.activeQuestion != null && state.activePermission == null)
                QuestionCardWidget(
                  question: state.activeQuestion!,
                  onAnswer: (id, answers) => notifier.answerQuestion(id, answers),
                  onReject: (id) => notifier.rejectQuestion(id),
                ),
              // Chat input
              ChatInput(
                canSend: canSend,
                onSend: (text, {mode, model}) =>
                    notifier.sendMessage(text, mode: mode, model: model),
              ),
            ],
          ),
        );
      },
    );
  }
}
