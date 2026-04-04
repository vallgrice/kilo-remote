import 'package:flutter/material.dart';
import '../../../../core/models/part.dart';
import '../../../../core/models/tool_state.dart';
import '../../../../shared/theme/app_colors.dart';
import 'tool_card_shell.dart';

class BashToolCard extends StatelessWidget {
  final ToolPart toolPart;
  const BashToolCard({super.key, required this.toolPart});

  @override
  Widget build(BuildContext context) {
    final input = toolPart.state.input;
    final command = input['command'] as String? ?? '';
    final preview = command.split('\n').first;
    final truncated =
        preview.length > 60 ? '${preview.substring(0, 57)}...' : preview;
    final output = toolPart.state.status == ToolStatus.completed
        ? toolPart.state.output?.toString()
        : null;
    final error = toolPart.state.status == ToolStatus.error
        ? toolPart.state.error
        : null;

    return ToolCardShell(
      icon: Icons.terminal,
      title: 'Shell',
      subtitle: '\$ $truncated',
      status: toolPart.state.status,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (command != truncated) ...[
            _label('Command:'),
            _codeBlock(command),
            const SizedBox(height: 8),
          ],
          if (output != null && output.isNotEmpty) ...[
            _label('Output:'),
            _codeBlock(output),
          ],
          if (error != null) ...[
            _label('Error:'),
            _codeBlock(error, isError: true),
          ],
        ],
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(text,
            style: const TextStyle(
                fontSize: 11, color: AppColors.textSecondary)),
      );

  Widget _codeBlock(String text, {bool isError = false}) => Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxHeight: 200),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.codeBackground,
          borderRadius: BorderRadius.circular(6),
        ),
        child: SingleChildScrollView(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'monospace',
              color: isError ? AppColors.error : AppColors.textPrimary,
            ),
          ),
        ),
      );
}
