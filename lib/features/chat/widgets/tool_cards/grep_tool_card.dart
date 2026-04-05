import 'package:flutter/material.dart';
import '../../../../core/models/part.dart';
import '../../../../core/models/tool_state.dart';
import '../../../../shared/theme/app_colors.dart';
import 'tool_card_shell.dart';

class GrepToolCard extends StatelessWidget {
  final ToolPart toolPart;
  const GrepToolCard({super.key, required this.toolPart});

  @override
  Widget build(BuildContext context) {
    final input = toolPart.state.input;
    final pattern = input['pattern'] as String? ?? '';
    final rawOutput = toolPart.state.output;
    final output = rawOutput?.toString();
    final hasOutput = output != null && output.isNotEmpty;

    return ToolCardShell(
      icon: Icons.manage_search,
      title: 'Grep',
      subtitle: pattern,
      status: toolPart.state.status,
      defaultExpanded: false,
      child: hasOutput
          ? Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxHeight: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.codeBackground,
                borderRadius: BorderRadius.circular(6),
              ),
              child: SingleChildScrollView(
                child: Text(output,
                    style: const TextStyle(
                        fontSize: 12, fontFamily: 'monospace')),
              ),
            )
          : toolPart.state.status == ToolStatus.completed
              ? const Text('No results',
                  style: TextStyle(fontSize: 12, color: AppColors.textSecondary))
              : null,
    );
  }
}
