import 'package:flutter/material.dart';
import '../../../../core/models/part.dart';
import '../../../../core/models/tool_state.dart';
import 'tool_card_shell.dart';

class TodoWriteToolCard extends StatelessWidget {
  final ToolPart toolPart;
  const TodoWriteToolCard({super.key, required this.toolPart});

  @override
  Widget build(BuildContext context) {
    final output = toolPart.state.status == ToolStatus.completed
        ? toolPart.state.output?.toString()
        : null;

    return ToolCardShell(
      icon: Icons.edit_note,
      title: 'Tasks',
      status: toolPart.state.status,
      child: output != null
          ? Text(output,
              style: const TextStyle(fontSize: 12, fontFamily: 'monospace'))
          : null,
    );
  }
}
