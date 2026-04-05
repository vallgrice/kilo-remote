import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/sessions_provider.dart';
import '../widgets/session_card.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/app_icon.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/utils/snackbar_utils.dart';

class SessionsScreen extends ConsumerWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(activeSessionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const AppIcon(size: 32),
            const SizedBox(width: 12),
            const Text('Sessions', style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () => ref.read(activeSessionsProvider.notifier).refresh(),
        child: sessionsAsync.when(
          loading: () => Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
          error: (e, _) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showAppSnackbar(
                context,
                message: 'Failed to load sessions: $e',
                type: SnackbarType.error,
                actionLabel: 'Retry',
                onAction: () => ref.read(activeSessionsProvider.notifier).refresh(),
              );
            });
            return EmptyState(
              type: EmptyStateType.sessions,
              useIllustration: true,
              customTitle: 'Failed to load',
              customSubtitle: 'Pull to refresh',
              onAction: () => ref.read(activeSessionsProvider.notifier).refresh(),
              actionLabel: 'Retry',
            );
          },
          data: (sessions) {
            if (sessions.isEmpty) {
              return EmptyState(
                type: EmptyStateType.sessions,
                useIllustration: true,
                onAction: () {},
                actionLabel: 'Learn more',
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                final session = sessions[index];
                return SessionCard(
                  session: session,
                  onTap: () => context.go('/chat/${session.id}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
