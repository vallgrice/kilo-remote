import 'package:flutter/material.dart';
import '../../../../core/models/part.dart';
import '../../../../shared/theme/app_colors.dart';
import 'tool_card_shell.dart';

class QuestionToolCard extends StatelessWidget {
  final ToolPart toolPart;
  const QuestionToolCard({super.key, required this.toolPart});

  @override
  Widget build(BuildContext context) {
    return ToolCardShell(
      icon: Icons.help_outline,
      title: 'Question',
      status: toolPart.state.status,
      child: const Text(
        'Question asked to user',
        style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
      ),
    );
  }
}
