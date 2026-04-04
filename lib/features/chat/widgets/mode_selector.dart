import 'package:flutter/material.dart';
import '../../../shared/theme/app_colors.dart';

const modes = ['code', 'plan', 'debug', 'orchestrator', 'ask'];

class ModeSelector extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const ModeSelector({super.key, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: modes.map((mode) {
          final isSelected = mode == selected;
          return Padding(
            padding: const EdgeInsets.only(right: 6),
            child: ChoiceChip(
              label: Text(mode[0].toUpperCase() + mode.substring(1)),
              selected: isSelected,
              onSelected: (_) => onChanged(mode),
              visualDensity: VisualDensity.compact,
              labelStyle: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : AppColors.textSecondary,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
