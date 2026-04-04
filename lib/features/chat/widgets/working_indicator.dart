import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/models/message.dart';
import '../../../core/models/part.dart';
import '../../../shared/theme/app_colors.dart';

const _toolStatusMap = {
  'read': 'Exploring',
  'grep': 'Searching the codebase',
  'glob': 'Searching the codebase',
  'list': 'Searching the codebase',
  'edit': 'Making edits',
  'write': 'Making edits',
  'bash': 'Running commands',
  'websearch': 'Searching the web',
  'webfetch': 'Searching the web',
  'todowrite': 'Planning next steps',
  'todoread': 'Planning next steps',
  'task': 'Delegating work',
  'question': 'Asking a question',
};

String computeStatus(Part part) {
  return switch (part) {
    ToolPart(:final tool) => _toolStatusMap[tool] ?? 'Considering next steps',
    ReasoningPart() => 'Thinking',
    TextPart() => 'Writing response',
    _ => 'Considering next steps',
  };
}

class WorkingIndicator extends StatefulWidget {
  final List<StoredMessage> messages;
  final bool isStreaming;

  const WorkingIndicator({
    super.key,
    required this.messages,
    required this.isStreaming,
  });

  @override
  State<WorkingIndicator> createState() => _WorkingIndicatorState();
}

class _WorkingIndicatorState extends State<WorkingIndicator> {
  DateTime? _startTime;
  Timer? _timer;
  int _elapsed = 0;

  @override
  void didUpdateWidget(covariant WorkingIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isStreaming && !oldWidget.isStreaming) {
      _startTime = DateTime.now();
      _elapsed = 0;
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (_startTime != null) {
          setState(() {
            _elapsed = DateTime.now().difference(_startTime!).inSeconds;
          });
        }
      });
    } else if (!widget.isStreaming && oldWidget.isStreaming) {
      _timer?.cancel();
      _timer = null;
      _startTime = null;
      _elapsed = 0;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatElapsed(int seconds) {
    if (seconds < 60) return '${seconds}s';
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m}m ${s}s';
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isStreaming) return const SizedBox.shrink();

    var statusText = 'Considering next steps';
    for (var i = widget.messages.length - 1; i >= 0; i--) {
      final msg = widget.messages[i];
      if (msg.info.role == 'assistant' && msg.parts.isNotEmpty) {
        statusText = computeStatus(msg.parts.last);
        break;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
          ),
          const SizedBox(width: 8),
          Text(
            '$statusText \u00b7 ${_formatElapsed(_elapsed)}',
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
