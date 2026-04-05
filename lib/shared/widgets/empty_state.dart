import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/theme/app_colors.dart';

enum EmptyStateType {
  sessions,
  chat,
  usage,
}

class EmptyState extends StatelessWidget {
  final EmptyStateType type;
  final String? customTitle;
  final String? customSubtitle;
  final VoidCallback? onAction;
  final String? actionLabel;
  final bool useIllustration;

  const EmptyState({
    super.key,
    required this.type,
    this.customTitle,
    this.customSubtitle,
    this.onAction,
    this.actionLabel,
    this.useIllustration = false,
  });

  @override
  Widget build(BuildContext context) {
    final (icon, title, subtitle) = _getContent();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            useIllustration ? _buildSvgIllustration() : _buildIllustration(icon),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (onAction != null && actionLabel != null) ...[
              const SizedBox(height: 24),
              TextButton(
                onPressed: onAction,
                child: Text(
                  actionLabel!,
                  style: const TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSvgIllustration() {
    final svgPath = switch (type) {
      EmptyStateType.sessions => 'assets/illustrations/empty_sessions.svg',
      EmptyStateType.chat => 'assets/illustrations/empty_chat.svg',
      EmptyStateType.usage => 'assets/illustrations/empty_usage.svg',
    };

    return SvgPicture.asset(
      svgPath,
      width: 120,
      height: 120,
    );
  }

  Widget _buildIllustration(IconData icon) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Icon(
        icon,
        size: 36,
        color: AppColors.primary,
      ),
    );
  }

  (IconData, String, String?) _getContent() {
    switch (type) {
      case EmptyStateType.sessions:
        return (
          Icons.terminal,
          customTitle ?? 'No sessions yet',
          customSubtitle ?? 'Start your first CLI session with kilo --remote',
        );
      case EmptyStateType.chat:
        return (
          Icons.chat_bubble_outline,
          customTitle ?? 'Start the conversation',
          customSubtitle ?? 'Send a message to begin',
        );
      case EmptyStateType.usage:
        return (
          Icons.bar_chart,
          customTitle ?? 'No usage data',
          customSubtitle ?? 'Usage will appear here',
        );
    }
  }
}