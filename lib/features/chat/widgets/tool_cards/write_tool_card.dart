import 'package:flutter/material.dart';
import '../../../../core/models/part.dart';
import '../../../../shared/theme/app_colors.dart';
import 'tool_card_shell.dart';

class WriteToolCard extends StatelessWidget {
  final ToolPart toolPart;
  const WriteToolCard({super.key, required this.toolPart});

  @override
  Widget build(BuildContext context) {
    final input = toolPart.state.input;
    final filePath = input['filePath'] as String? ?? '';
    final content = input['content'] as String? ?? '';
    final filename = filePath.split('/').last;
    final lines = content.split('\n').length;

    return ToolCardShell(
      icon: Icons.create,
      title: 'Write',
      subtitle: filename,
      badge: Text('$lines lines',
          style: const TextStyle(
              fontSize: 11, color: AppColors.textSecondary)),
      status: toolPart.state.status,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxHeight: 200),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.codeBackground,
          borderRadius: BorderRadius.circular(6),
        ),
        child: SingleChildScrollView(
          child: Text(content,
              style: const TextStyle(fontSize: 12, fontFamily: 'monospace')),
        ),
      ),
    );
  }
}
