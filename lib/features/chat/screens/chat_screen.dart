import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/session_notifier.dart';
import '../widgets/message_list.dart';
import '../widgets/chat_input.dart';
import '../widgets/working_indicator.dart';
import '../widgets/permission_card.dart';
import '../widgets/question_card.dart';
import '../../../core/transport/web_socket_transport.dart' as transport;
import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/utils/snackbar_utils.dart';
import '../../sessions/providers/sessions_provider.dart';

class ChatScreen extends ConsumerWidget {
  final String sessionId;

  const ChatScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(sessionNotifierProvider(sessionId));
    final sessions = ref.watch(activeSessionsProvider).valueOrNull ?? [];
    final sessionMeta = sessions.where((s) => s.id == sessionId).firstOrNull;

    return sessionAsync.when(
      loading: () => Scaffold(
        appBar: _buildAppBar(context, null, false, sessionMeta),
        body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
      ),
      error: (e, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showAppSnackbar(
            context,
            message: 'Connection error: $e',
            type: SnackbarType.error,
          );
        });
        return Scaffold(
          appBar: _buildAppBar(context, null, false, sessionMeta),
          body: EmptyState(
            type: EmptyStateType.chat,
            customTitle: 'Connection error',
            customSubtitle: 'Pull to reconnect',
          ),
        );
      },
      data: (state) {
        final notifier = ref.read(sessionNotifierProvider(sessionId).notifier);
        final isConnected = state.connectionState == transport.ConnectionState.connected;
        final canSend = isConnected && !state.isStreaming;

        if (state.error != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showAppSnackbar(
              context,
              message: state.error!,
              type: SnackbarType.error,
              actionLabel: 'Dismiss',
              onAction: () => notifier.clearError(),
            );
          });
        }

        return Scaffold(
          appBar: _buildAppBar(context, state, isConnected, sessionMeta,
            onInterrupt: state.isStreaming ? () => notifier.interrupt() : null,
          ),
          body: Column(
            children: [
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
              Expanded(
                child: MessageList(
                  messages: state.messages,
                  isStreaming: state.isStreaming,
                  hasMore: state.hasMore,
                  onLoadMore: () => notifier.loadMore(),
                ),
              ),
              WorkingIndicator(
                messages: state.messages,
                isStreaming: state.isStreaming,
              ),
              if (state.activePermission != null)
                PermissionCardWidget(
                  permission: state.activePermission!,
                  onRespond: (id, response) => notifier.respondToPermission(id, response),
                ),
              if (state.activeQuestion != null && state.activePermission == null)
                QuestionCardWidget(
                  question: state.activeQuestion!,
                  onAnswer: (id, answers) => notifier.answerQuestion(id, answers),
                  onReject: (id) => notifier.rejectQuestion(id),
                ),
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

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    SessionState? state,
    bool isConnected,
    dynamic sessionMeta, {
    VoidCallback? onInterrupt,
  }) {
    final title = sessionMeta?.title ?? 'Session';
    final branch = sessionMeta?.gitBranch;

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: Material(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => context.go('/sessions'),
            child: const Icon(Icons.arrow_back, size: 20),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          if (branch != null)
            Text(branch, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isConnected ? AppColors.success : AppColors.error,
              shape: BoxShape.circle,
              boxShadow: isConnected
                  ? [BoxShadow(color: AppColors.success.withOpacity(0.4), blurRadius: 6)]
                  : null,
            ),
          ),
        ),
        if (onInterrupt != null)
          IconButton(
            onPressed: onInterrupt,
            icon: const Icon(Icons.stop_circle, color: AppColors.error),
            tooltip: 'Interrupt',
          ),
      ],
    );
  }
}
