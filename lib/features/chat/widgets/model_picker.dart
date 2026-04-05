import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/chat_providers.dart';
import '../../../shared/theme/app_colors.dart';

class ModelPicker extends ConsumerWidget {
  final String? selected;
  final ValueChanged<String> onChanged;

  const ModelPicker({super.key, this.selected, required this.onChanged});

  String _shortName(String? id, String? name) {
    if (id == null || id.isEmpty) return 'Model';
    
    // Handle coding plan providers: zai-coding/glm-4.7 -> GLM-4.7
    // Handle other providers with slashes: provider/model -> model
    final slashIdx = id.indexOf('/');
    if (slashIdx >= 0 && slashIdx + 1 < id.length) {
      return id.substring(slashIdx + 1);
    }
    
    // Handle OpenRouter models: provider:model -> model
    if (name != null && name.isNotEmpty) {
      final idx = name.indexOf(':');
      if (idx >= 0 && idx + 1 < name.length) {
        return name.substring(idx + 1).trim();
      }
    }
    return id;
  }

  void _openSheet(BuildContext context, List<Map<String, dynamic>> models) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => _ModelPickerSheet(
        models: models,
        selected: selected,
        onSelected: (id) {
          Navigator.of(ctx).pop();
          onChanged(id);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelsAsync = ref.watch(modelsProvider);

    return modelsAsync.when(
      loading: () => const SizedBox(
        width: 120,
        child: LinearProgressIndicator(minHeight: 2),
      ),
      error: (_, __) => const Text(
        'Models unavailable',
        style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
      ),
      data: (models) {
        String? selectedName;
        if (selected != null) {
          final match = models.where((m) => m['id']?.toString() == selected).firstOrNull;
          selectedName = _shortName(selected, match?['name']?.toString());
        }

        return GestureDetector(
          onTap: () => _openSheet(context, models),
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
                  selectedName ?? 'Model',
                  style: TextStyle(
                    fontSize: 12,
                    color: selected != null
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.expand_more,
                  size: 14,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ModelPickerSheet extends StatefulWidget {
  final List<Map<String, dynamic>> models;
  final String? selected;
  final ValueChanged<String> onSelected;

  const _ModelPickerSheet({
    required this.models,
    required this.selected,
    required this.onSelected,
  });

  @override
  State<_ModelPickerSheet> createState() => _ModelPickerSheetState();
}

class _ModelPickerSheetState extends State<_ModelPickerSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filtered {
    if (_query.isEmpty) return widget.models;
    final q = _query.toLowerCase();
    return widget.models.where((m) {
      final id = m['id']?.toString().toLowerCase() ?? '';
      final name = m['name']?.toString().toLowerCase() ?? '';
      return id.contains(q) || name.contains(q);
    }).toList();
  }

  String _provider(String id) {
    final idx = id.indexOf('/');
    if (idx >= 0) return id.substring(0, idx);
    return id;
  }

  String _providerLabel(String provider) {
    switch (provider) {
      case 'zai-coding':
        return 'Z.AI CODING';
      case 'kimi-coding':
        return 'KIMI CODING';
      case 'byteplus-coding':
        return 'BYTEPLUS CODING';
      case 'anthropic':
        return 'ANTHROPIC';
      case 'openai':
        return 'OPENAI';
      case 'kilo-auto':
        return 'KILO AUTO';
      case 'google':
        return 'GOOGLE';
      case 'mistral':
        return 'MISTRAL';
      case 'cohere':
        return 'COHERE';
      case 'minimax':
        return 'MINIMAX';
      case 'xai':
        return 'XAI';
      case 'bedrock':
        return 'AWS BEDROCK';
      case 'inception':
        return 'INCEPTION';
      default:
        return provider.toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    final recommended = filtered
        .where((m) => (m['id']?.toString() ?? '').startsWith('kilo-auto/'))
        .toList();
    final rest =
        filtered.where((m) => !(m['id']?.toString() ?? '').startsWith('kilo-auto/')).toList();

    // Group rest by provider
    final Map<String, List<Map<String, dynamic>>> byProvider = {};
    for (final m in rest) {
      final id = m['id']?.toString() ?? '';
      final provider = _provider(id);
      byProvider.putIfAbsent(provider, () => []).add(m);
    }
    final providers = byProvider.keys.toList()..sort();

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, scrollController) {
        return Column(
          children: [
            // Drag handle
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 8),
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // Search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: _searchController,
                autofocus: false,
                style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
                decoration: InputDecoration(
                  hintText: 'Search models...',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                  filled: true,
                  fillColor: AppColors.surfaceElevated,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: AppColors.primary, width: 1.5),
                  ),
                ),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            const Divider(color: AppColors.border, height: 1),
            // List
            Expanded(
              child: ListView(
                controller: scrollController,
                children: [
                  if (recommended.isNotEmpty) ...[
                    _SectionHeader('RECOMMENDED'),
                    ...recommended.map((m) => _ModelItem(
                          model: m,
                          isSelected: m['id']?.toString() == widget.selected,
                          onTap: () => widget.onSelected(m['id']?.toString() ?? ''),
                        )),
                    if (providers.isNotEmpty)
                      const Divider(color: AppColors.border, height: 1),
                  ],
                  if (providers.isNotEmpty) ...[
                    _SectionHeader('ALL MODELS'),
                    ...providers.expand((provider) => [
                          _ProviderHeader(_providerLabel(provider)),
                          ...byProvider[provider]!.map((m) => _ModelItem(
                                model: m,
                                isSelected:
                                    m['id']?.toString() == widget.selected,
                                onTap: () =>
                                    widget.onSelected(m['id']?.toString() ?? ''),
                              )),
                        ]),
                  ],
                  if (recommended.isEmpty && providers.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(
                        child: Text(
                          'No models match your search.',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _ProviderHeader extends StatelessWidget {
  final String label;
  const _ProviderHeader(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 2),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

class _ModelItem extends StatelessWidget {
  final Map<String, dynamic> model;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModelItem({
    required this.model,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final id = model['id']?.toString() ?? '';
    final name = model['name']?.toString() ?? id;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    id,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, size: 18, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
