import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../core/models/part.dart';
import '../../../shared/theme/app_colors.dart';
import 'tool_cards/bash_tool_card.dart';
import 'tool_cards/edit_tool_card.dart';
import 'tool_cards/read_tool_card.dart';
import 'tool_cards/write_tool_card.dart';
import 'tool_cards/glob_tool_card.dart';
import 'tool_cards/grep_tool_card.dart';
import 'tool_cards/web_search_tool_card.dart';
import 'tool_cards/list_tool_card.dart';
import 'tool_cards/todo_read_tool_card.dart';
import 'tool_cards/todo_write_tool_card.dart';
import 'tool_cards/question_tool_card.dart';
import 'tool_cards/generic_tool_card.dart';

class PartRenderer extends StatelessWidget {
  final Part part;

  const PartRenderer({super.key, required this.part});

  @override
  Widget build(BuildContext context) {
    return switch (part) {
      TextPart(:final text) => text.isNotEmpty
          ? MarkdownBody(
              data: text,
              styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                p: const TextStyle(fontSize: 14, height: 1.5),
                code: TextStyle(
                  fontSize: 13,
                  fontFamily: 'monospace',
                  backgroundColor: AppColors.codeBackground,
                ),
                codeblockDecoration: BoxDecoration(
                  color: AppColors.codeBackground,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              selectable: true,
            )
          : const SizedBox.shrink(),
      ToolPart() => _toolCard(part as ToolPart),
      ReasoningPart() => _ReasoningCard(part: part as ReasoningPart),
      FilePart(:final filename) => _FileCard(filename: filename ?? 'File'),
      SubtaskPart(:final agent, :final description) => _SubtaskCard(agent: agent, description: description),
      PatchPart() => const SizedBox.shrink(),
      StepStartPart() => const SizedBox.shrink(),
      StepFinishPart() => const SizedBox.shrink(),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _toolCard(ToolPart toolPart) {
    return switch (toolPart.tool) {
      'bash' => BashToolCard(toolPart: toolPart),
      'edit' => EditToolCard(toolPart: toolPart),
      'read' => ReadToolCard(toolPart: toolPart),
      'write' => WriteToolCard(toolPart: toolPart),
      'glob' => GlobToolCard(toolPart: toolPart),
      'grep' => GrepToolCard(toolPart: toolPart),
      'websearch' => WebSearchToolCard(toolPart: toolPart),
      'list' => ListToolCard(toolPart: toolPart),
      'todoread' => TodoReadToolCard(toolPart: toolPart),
      'todowrite' => TodoWriteToolCard(toolPart: toolPart),
      'question' => QuestionToolCard(toolPart: toolPart),
      _ => GenericToolCard(toolPart: toolPart),
    };
  }
}

class _ReasoningCard extends StatefulWidget {
  final ReasoningPart part;
  const _ReasoningCard({required this.part});

  @override
  State<_ReasoningCard> createState() => _ReasoningCardState();
}

class _ReasoningCardState extends State<_ReasoningCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final isThinking = widget.part.time?.end == null;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.psychology, size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: 8),
                  const Text(
                    'Reasoning',
                    style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                  ),
                  if (isThinking)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('(thinking...)',
                          style: TextStyle(fontSize: 11, color: AppColors.warning)),
                    ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.expand_more, size: 16, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ),
          if (_expanded) ...[
            const Divider(height: 1, color: AppColors.border),
            Padding(
              padding: const EdgeInsets.all(12),
              child: MarkdownBody(
                data: widget.part.text,
                styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                  p: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.5),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _FileCard extends StatelessWidget {
  final String filename;
  const _FileCard({required this.filename});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.insert_drive_file, size: 16, color: AppColors.textSecondary),
          const SizedBox(width: 8),
          Text(filename, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}

class _SubtaskCard extends StatelessWidget {
  final String agent;
  final String? description;
  const _SubtaskCard({required this.agent, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('Subtask', style: TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w500)),
              ),
              const SizedBox(width: 8),
              Text(agent, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
            ],
          ),
          if (description != null) ...[
            const SizedBox(height: 4),
            Text(description!, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          ],
        ],
      ),
    );
  }
}
