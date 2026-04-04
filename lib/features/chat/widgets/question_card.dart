import 'package:flutter/material.dart';
import '../../../core/models/question.dart';
import '../../../shared/theme/app_colors.dart';

class QuestionCardWidget extends StatefulWidget {
  final QuestionRequest question;
  final Future<void> Function(String requestId, List<List<String>> answers) onAnswer;
  final Future<void> Function(String requestId) onReject;

  const QuestionCardWidget({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onReject,
  });

  @override
  State<QuestionCardWidget> createState() => _QuestionCardWidgetState();
}

class _QuestionCardWidgetState extends State<QuestionCardWidget> {
  final Map<int, String> _answers = {};
  final Map<int, TextEditingController> _controllers = {};
  bool _isPending = false;

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _isPending = true);
    final answers = widget.question.questions.asMap().entries.map((e) {
      final answer = _answers[e.key] ?? _controllers[e.key]?.text ?? '';
      return [answer];
    }).toList();
    try {
      await widget.onAnswer(widget.question.requestId, answers);
    } catch (_) {
      if (mounted) setState(() => _isPending = false);
    }
  }

  Future<void> _reject() async {
    setState(() => _isPending = true);
    try {
      await widget.onReject(widget.question.requestId);
    } catch (_) {
      if (mounted) setState(() => _isPending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(12),
        border: const Border(left: BorderSide(color: AppColors.primary, width: 4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.help_outline, size: 18, color: AppColors.primary),
                SizedBox(width: 8),
                Text('Question', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 12),
            for (var i = 0; i < widget.question.questions.length; i++) ...[
              _buildQuestion(i, widget.question.questions[i]),
              if (i < widget.question.questions.length - 1) const SizedBox(height: 12),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _isPending ? null : _submit,
                  child: _isPending
                      ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : const Text('Answer'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: _isPending ? null : _reject,
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.border)),
                  child: const Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(int index, QuestionInfo q) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (q.text != null)
          Text(q.text!, style: const TextStyle(fontSize: 13)),
        const SizedBox(height: 8),
        if (q.options.isNotEmpty)
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: q.options.map((opt) {
              final selected = _answers[index] == opt;
              return ChoiceChip(
                label: Text(opt),
                selected: selected,
                onSelected: (_) => setState(() => _answers[index] = opt),
                visualDensity: VisualDensity.compact,
              );
            }).toList(),
          )
        else
          TextField(
            controller: _controllers.putIfAbsent(index, () => TextEditingController()),
            decoration: const InputDecoration(
              hintText: 'Type your answer...',
              isDense: true,
            ),
          ),
      ],
    );
  }
}
