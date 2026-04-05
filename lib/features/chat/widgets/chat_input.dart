import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/chat_providers.dart';
import '../../../shared/theme/app_colors.dart';
import 'mode_selector.dart';
import 'model_picker.dart';

class ChatInput extends ConsumerStatefulWidget {
  final bool canSend;
  final Future<void> Function(String text, {String? mode, String? model}) onSend;

  const ChatInput({super.key, required this.canSend, required this.onSend});

  @override
  ConsumerState<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends ConsumerState<ChatInput> {
  final _controller = TextEditingController();
  bool _isSending = false;

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty || !widget.canSend || _isSending) return;

    setState(() => _isSending = true);
    final mode = ref.read(selectedModeProvider);
    final model = ref.read(selectedModelProvider);

    try {
      await widget.onSend(text, mode: mode, model: model);
      _controller.clear();
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mode = ref.watch(selectedModeProvider);
    final model = ref.watch(selectedModelProvider);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: ModeSelector(
                    selected: mode,
                    onChanged: (m) => ref.read(selectedModeProvider.notifier).state = m,
                  ),
                ),
                ModelPicker(
                  selected: model,
                  onChanged: (m) => ref.read(selectedModelProvider.notifier).setModel(m),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    maxLines: 5,
                    minLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Message...',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      isDense: true,
                    ),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _send(),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: widget.canSend && !_isSending
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [AppColors.primary, AppColors.primaryDark],
                          )
                        : null,
                    color: widget.canSend && !_isSending ? null : AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: widget.canSend && !_isSending ? _send : null,
                    padding: EdgeInsets.zero,
                    icon: _isSending
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.onPrimary,
                            ),
                          )
                        : Icon(
                            Icons.arrow_upward,
                            size: 20,
                            color: widget.canSend ? AppColors.onPrimary : AppColors.textSecondary,
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
