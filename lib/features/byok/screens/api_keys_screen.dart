import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/models/byok.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/utils/snackbar_utils.dart';
import '../providers/byok_provider.dart';

class ApiKeysScreen extends ConsumerWidget {
  const ApiKeysScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keysAsync = ref.watch(byokKeysProvider);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Material(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => context.go('/profile'),
              child: const Icon(Icons.arrow_back, size: 20),
            ),
          ),
        ),
        title: const Row(
          children: [
            Icon(Icons.key, size: 24),
            SizedBox(width: 12),
            Text('API Keys', style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      body: keysAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showAppSnackbar(
              context,
              message: 'Failed to load API keys: $e',
              type: SnackbarType.error,
            );
          });
          return EmptyState(
            type: EmptyStateType.usage,
            customTitle: 'Failed to load',
            onAction: () => ref.read(byokActionsProvider).refresh(),
            actionLabel: 'Retry',
          );
        },
        data: (keys) {
          if (keys.isEmpty) {
            return EmptyState(
              type: EmptyStateType.usage,
              customTitle: 'No API keys',
              customSubtitle: 'Add a key to use your own models',
              onAction: () => _showAddKeyDialog(context, ref),
              actionLabel: 'Add Key',
            );
          }
          return RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () async => ref.read(byokActionsProvider).refresh(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: keys.length,
              itemBuilder: (context, index) {
                final key = keys[index];
                return _ByokKeyCard(
                  byokKey: key,
                  onEdit: () => _showEditKeyDialog(context, ref, key),
                  onDelete: () => _confirmDelete(context, ref, key),
                  onToggle: () => _toggleEnabled(ref, key),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => _showAddKeyDialog(context, ref),
        child: const Icon(Icons.add, color: AppColors.onPrimary),
      ),
    );
  }

  Future<void> _showAddKeyDialog(BuildContext context, WidgetRef ref) async {
    return _showKeyDialog(context, ref, null);
  }

  Future<void> _showEditKeyDialog(BuildContext context, WidgetRef ref, ByokKey key) async {
    return _showKeyDialog(context, ref, key);
  }

  Future<void> _showKeyDialog(BuildContext context, WidgetRef ref, ByokKey? existingKey) async {
    final providersAsync = ref.read(byokSupportedModelsProvider);
    final providers = providersAsync.valueOrNull ?? {};
    String? selectedProvider = existingKey?.providerId;
    bool isLoading = false;
    final apiKeyController = TextEditingController();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    existingKey == null ? 'Add API Key' : 'Update API Key',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (existingKey == null) ...[
                    DropdownButtonFormField<String>(
                      value: selectedProvider,
                      decoration: InputDecoration(
                        labelText: 'Provider',
                        filled: true,
                        fillColor: AppColors.surfaceElevated,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppColors.border),
                        ),
                      ),
                      dropdownColor: AppColors.surfaceElevated,
                      items: providers.keys.map((p) {
                        return DropdownMenuItem(value: p, child: Text(p));
                      }).toList(),
                      onChanged: (v) => setState(() => selectedProvider = v),
                    ),
                    const SizedBox(height: 12),
                  ],
                  TextField(
                    controller: apiKeyController,
                    decoration: InputDecoration(
                      labelText: 'API Key',
                      filled: true,
                      fillColor: AppColors.surfaceElevated,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            final provider = selectedProvider ?? existingKey!.providerId;
                            final apiKey = apiKeyController.text.trim();
                            if (apiKey.isEmpty) return;

                            setState(() => isLoading = true);
                            try {
                              final actions = ref.read(byokActionsProvider);
                              if (existingKey == null) {
                                await actions.createKey(providerId: provider, apiKey: apiKey);
                              } else {
                                await actions.updateKey(id: existingKey.id, apiKey: apiKey);
                              }
                              if (ctx.mounted) Navigator.of(ctx).pop();
                            } catch (e) {
                              if (ctx.mounted) {
                                showAppSnackbar(ctx, message: 'Error: $e', type: SnackbarType.error);
                              }
                            } finally {
                              setState(() => isLoading = false);
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(existingKey == null ? 'Add' : 'Update'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, ByokKey key) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Delete API Key', style: TextStyle(color: AppColors.textPrimary)),
        content: Text(
          'Delete API key for ${key.providerName}?',
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await ref.read(byokActionsProvider).deleteKey(key.id);
      } catch (e) {
        if (context.mounted) {
          showAppSnackbar(context, message: 'Failed to delete: $e', type: SnackbarType.error);
        }
      }
    }
  }

  Future<void> _toggleEnabled(WidgetRef ref, ByokKey key) async {
    try {
      await ref.read(byokActionsProvider).setEnabled(
            id: key.id,
            isEnabled: !key.isEnabled,
          );
    } catch (e) {
      // Error handled by provider
    }
  }
}

class _ByokKeyCard extends StatelessWidget {
  final ByokKey byokKey;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  const _ByokKeyCard({
    required this.byokKey,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      byokKey.providerName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ID: ${byokKey.id.substring(0, 8)}...',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: byokKey.isEnabled,
                onChanged: (_) => onToggle(),
                activeColor: AppColors.primary,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, size: 16),
                  label: const Text('Edit'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: const BorderSide(color: AppColors.border),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete, size: 16),
                  label: const Text('Delete'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: const BorderSide(color: AppColors.error),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
