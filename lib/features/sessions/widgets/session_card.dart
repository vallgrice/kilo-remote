import 'package:flutter/material.dart';
import '../../../core/models/session.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/status_badge.dart';

class SessionCard extends StatelessWidget {
  final ActiveSession session;
  final VoidCallback onTap;

  const SessionCard({super.key, required this.session, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      session.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  StatusBadge(
                    label: session.status == 'active' ? 'Active' : session.status,
                    color: session.status == 'active'
                        ? AppColors.success
                        : AppColors.warning,
                    pulsing: session.status == 'active',
                  ),
                ],
              ),
              if (session.gitBranch != null || session.gitUrl != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.commit, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        [
                          if (session.gitBranch != null) session.gitBranch,
                          if (session.gitUrl != null)
                            session.gitUrl!.split('/').last.replaceAll('.git', ''),
                        ].join(' · '),
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
