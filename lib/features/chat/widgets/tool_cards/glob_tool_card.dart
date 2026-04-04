import 'package:flutter/material.dart';
import '../../../../core/models/part.dart';
import '../../../../core/models/tool_state.dart';
import '../../../../shared/theme/app_colors.dart';
import 'tool_card_shell.dart';

class GlobToolCard extends StatelessWidget {
  final ToolPart toolPart;
  const GlobToolCard({super.key, required this.toolPart});

  @override
  Widget build(BuildContext context) {
    final input = toolPart.state.input;
    final pattern = input['pattern'] as String? ?? '';
    final output = toolPart.state.status == ToolStatus.completed
        ? toolPart.state.output
        : null;
    final files = output is List ? output.cast<String>() : <String>[];

    return ToolCardShell(
      icon: Icons.search,
      title: 'Glob',
      subtitle: pattern,
      badge: files.isNotEmpty
          ? Text('${files.length} files',
              style: const TextStyle(
                  fontSize: 11, color: AppColors.textSecondary))
          : null,
      status: toolPart.state.status,
      child: files.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: files
                  .take(20)
                  .map((f) => Text(
                        f,
                        style: const TextStyle(
                            fontSize: 12, fontFamily: 'monospace'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ))
                  .toList(),
            )
          : null,
    );
  }
}
