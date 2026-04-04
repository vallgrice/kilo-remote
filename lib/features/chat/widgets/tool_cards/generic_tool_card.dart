import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../core/models/part.dart';
import '../../../../core/models/tool_state.dart';
import '../../../../shared/theme/app_colors.dart';
import 'tool_card_shell.dart';

class GenericToolCard extends StatelessWidget {
  final ToolPart toolPart;
  const GenericToolCard({super.key, required this.toolPart});

  @override
  Widget build(BuildContext context) {
    final output = toolPart.state.status == ToolStatus.completed
        ? toolPart.state.output
        : null;

    String formatJson(dynamic data) {
      try {
        return const JsonEncoder.withIndent('  ').convert(data);
      } catch (_) {
        return data.toString();
      }
    }

    return ToolCardShell(
      icon: Icons.extension,
      title: toolPart.tool,
      status: toolPart.state.status,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (toolPart.state.input.isNotEmpty) ...[
            const Text('Input:',
                style: TextStyle(
                    fontSize: 11, color: AppColors.textSecondary)),
            const SizedBox(height: 2),
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxHeight: 150),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.codeBackground,
                borderRadius: BorderRadius.circular(6),
              ),
              child: SingleChildScrollView(
                child: Text(
                  formatJson(toolPart.state.input),
                  style: const TextStyle(
                      fontSize: 11, fontFamily: 'monospace'),
                ),
              ),
            ),
          ],
          if (output != null) ...[
            const SizedBox(height: 8),
            const Text('Output:',
                style: TextStyle(
                    fontSize: 11, color: AppColors.textSecondary)),
            const SizedBox(height: 2),
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxHeight: 150),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.codeBackground,
                borderRadius: BorderRadius.circular(6),
              ),
              child: SingleChildScrollView(
                child: Text(
                  formatJson(output),
                  style: const TextStyle(
                      fontSize: 11, fontFamily: 'monospace'),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
