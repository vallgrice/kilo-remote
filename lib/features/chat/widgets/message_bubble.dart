import 'package:flutter/material.dart';
import '../../../core/models/message.dart';
import '../../../shared/theme/app_colors.dart';
import 'part_renderer.dart';

class MessageBubble extends StatelessWidget {
  final StoredMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.info.role == 'user';

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.85,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: isUser
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primary, AppColors.primaryDark],
                )
              : null,
          color: isUser ? null : AppColors.surface,
          border: isUser ? null : Border.all(color: AppColors.border.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(18).copyWith(
            bottomRight: isUser ? const Radius.circular(6) : null,
            bottomLeft: !isUser ? const Radius.circular(6) : null,
          ),
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: isUser ? AppColors.onPrimary : AppColors.textPrimary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final part in message.parts) ...[
                PartRenderer(part: part, isUserMessage: isUser),
                if (part != message.parts.last) const SizedBox(height: 8),
              ],
              if (message.parts.isEmpty && isUser)
                Text('...', style: TextStyle(
                  color: isUser ? AppColors.onPrimary.withOpacity(0.6) : AppColors.textSecondary,
                )),
            ],
          ),
        ),
      ),
    );
  }
}
