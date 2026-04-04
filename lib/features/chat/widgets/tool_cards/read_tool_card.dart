import 'package:flutter/material.dart';
import '../../../../core/models/part.dart';
import '../../../../core/models/tool_state.dart';
import '../../../../shared/theme/app_colors.dart';
import 'tool_card_shell.dart';

class ReadToolCard extends StatelessWidget {
  final ToolPart toolPart;
  const ReadToolCard({super.key, required this.toolPart});

  @override
  Widget build(BuildContext context) {
    final input = toolPart.state.input;
    final filePath = input['filePath'] as String? ?? '';
    final filename = filePath.split('/').last;
    final limit = input['limit'];
    final offset = input['offset'];
    final rangeText = [
      if (offset != null) 'from $offset',
      if (limit != null) '$limit lines',
    ].join(', ');

    return ToolCardShell(
      icon: Icons.description,
      title: 'Read',
      subtitle: filename,
      badge: rangeText.isNotEmpty
          ? Text(rangeText,
              style: const TextStyle(
                  fontSize: 11, color: AppColors.textSecondary))
          : null,
      status: toolPart.state.status,
      child: toolPart.state.status == ToolStatus.completed
          ? Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxHeight: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.codeBackground,
                borderRadius: BorderRadius.circular(6),
              ),
              child: SingleChildScrollView(
                child: Text(
                  toolPart.state.output?.toString() ?? '',
                  style:
                      const TextStyle(fontSize: 12, fontFamily: 'monospace'),
                ),
              ),
            )
          : null,
    );
  }
}
