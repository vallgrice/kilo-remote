import 'package:flutter/material.dart';
import '../../../../core/models/part.dart';
import '../../../../core/models/tool_state.dart';
import '../../../../shared/theme/app_colors.dart';
import 'tool_card_shell.dart';

class EditToolCard extends StatelessWidget {
  final ToolPart toolPart;
  const EditToolCard({super.key, required this.toolPart});

  @override
  Widget build(BuildContext context) {
    final input = toolPart.state.input;
    final filePath = input['filePath'] as String? ?? '';
    final oldString = input['oldString'] as String? ?? '';
    final newString = input['newString'] as String? ?? '';
    final filename = filePath.split('/').last;
    final error = toolPart.state.status == ToolStatus.error
        ? toolPart.state.error
        : null;

    return ToolCardShell(
      icon: Icons.edit,
      title: 'Edit',
      subtitle: filename,
      status: toolPart.state.status,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (filePath != filename)
            Text(filePath,
                style: const TextStyle(
                    fontSize: 11,
                    fontFamily: 'monospace',
                    color: AppColors.textSecondary)),
          const SizedBox(height: 4),
          _diffBlock('Old:', oldString, const Color(0xFFEF4444)),
          const SizedBox(height: 8),
          _diffBlock('New:', newString, const Color(0xFF22C55E)),
          if (error != null) ...[
            const SizedBox(height: 8),
            _diffBlock('Error:', error, AppColors.error),
          ],
        ],
      ),
    );
  }

  Widget _diffBlock(String label, String text, Color color) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 11, color: AppColors.textSecondary)),
          const SizedBox(height: 2),
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxHeight: 160),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.codeBackground,
              borderRadius: BorderRadius.circular(6),
            ),
            child: SingleChildScrollView(
              child: Text(
                text.isEmpty ? '(empty)' : text,
                style: TextStyle(
                    fontSize: 12, fontFamily: 'monospace', color: color),
              ),
            ),
          ),
        ],
      );
}
