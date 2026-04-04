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
          color: isUser ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(16).copyWith(
            bottomRight: isUser ? const Radius.circular(4) : null,
            bottomLeft: !isUser ? const Radius.circular(4) : null,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final part in message.parts) ...[
              PartRenderer(part: part),
              if (part != message.parts.last) const SizedBox(height: 8),
            ],
            if (message.parts.isEmpty && isUser)
              const Text('...', style: TextStyle(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
