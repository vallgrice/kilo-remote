import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/chat_providers.dart';
import '../../../shared/theme/app_colors.dart';

class ModelPicker extends ConsumerWidget {
  final String? selected;
  final ValueChanged<String> onChanged;

  const ModelPicker({super.key, this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelsAsync = ref.watch(modelsProvider);

    return modelsAsync.when(
      loading: () => const SizedBox(
        width: 120,
        child: LinearProgressIndicator(minHeight: 2),
      ),
      error: (_, __) => const Text('Models unavailable',
          style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
      data: (models) {
        return PopupMenuButton<String>(
          onSelected: onChanged,
          itemBuilder: (context) => models.map((m) {
            final id = m['id']?.toString() ?? '';
            final name = m['name']?.toString() ?? id;
            return PopupMenuItem<String>(
              value: id,
              child: Text(name, style: const TextStyle(fontSize: 13)),
            );
          }).toList(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selected ?? 'Model',
                  style: TextStyle(
                    fontSize: 12,
                    color: selected != null ? AppColors.textPrimary : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.expand_more, size: 14, color: AppColors.textSecondary),
              ],
            ),
          ),
        );
      },
    );
  }
}
