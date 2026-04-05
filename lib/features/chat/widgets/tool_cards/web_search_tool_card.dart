import 'package:flutter/material.dart';
import '../../../../core/models/part.dart';
import '../../../../core/models/tool_state.dart';
import '../../../../shared/theme/app_colors.dart';
import 'tool_card_shell.dart';

class WebSearchToolCard extends StatelessWidget {
  final ToolPart toolPart;
  const WebSearchToolCard({super.key, required this.toolPart});

  @override
  Widget build(BuildContext context) {
    final input = toolPart.state.input;
    final query = input['query'] as String? ?? '';
    final rawOutput = toolPart.state.output;

    Widget? body;
    if (rawOutput is List && rawOutput.isNotEmpty) {
      body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rawOutput.take(5).map((r) {
          final result =
              r is Map<String, dynamic> ? r : <String, dynamic>{};
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result['title']?.toString() ?? '',
                  style: const TextStyle(
                      fontSize: 13, color: AppColors.primary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (result['url'] != null)
                  Text(
                    result['url'].toString(),
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.textSecondary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          );
        }).toList(),
      );
    } else if (rawOutput != null && rawOutput.toString().isNotEmpty) {
      body = Text(rawOutput.toString(),
          style: const TextStyle(fontSize: 12, fontFamily: 'monospace'));
    } else if (toolPart.state.status == ToolStatus.completed) {
      body = const Text('No results',
          style: TextStyle(fontSize: 12, color: AppColors.textSecondary));
    }

    return ToolCardShell(
      icon: Icons.travel_explore,
      title: 'Web Search',
      subtitle: query,
      status: toolPart.state.status,
      child: body,
    );
  }
}
