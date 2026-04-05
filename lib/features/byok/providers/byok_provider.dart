import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/byok_repository.dart';
import '../../../core/models/byok.dart';

final byokRepositoryProvider = Provider<ByokRepository>((ref) {
  return ByokRepository();
});

final byokKeysProvider = FutureProvider<List<ByokKey>>((ref) async {
  final repo = ref.read(byokRepositoryProvider);
  return repo.list();
});

final byokSupportedModelsProvider = FutureProvider<Map<String, List<String>>>((ref) async {
  final repo = ref.read(byokRepositoryProvider);
  return repo.listSupportedModels();
});

final byokActionsProvider = Provider<ByokActions>((ref) {
  return ByokActions(ref);
});

class ByokActions {
  final Ref _ref;

  ByokActions(this._ref);

  Future<void> refresh() async {
    _ref.invalidate(byokKeysProvider);
    _ref.invalidate(byokSupportedModelsProvider);
  }

  Future<ByokKey> createKey({
    required String providerId,
    required String apiKey,
  }) async {
    final repo = _ref.read(byokRepositoryProvider);
    final key = await repo.create(providerId: providerId, apiKey: apiKey);
    _ref.invalidate(byokKeysProvider);
    return key;
  }

  Future<ByokKey> updateKey({
    required String id,
    required String apiKey,
  }) async {
    final repo = _ref.read(byokRepositoryProvider);
    final key = await repo.update(id: id, apiKey: apiKey);
    _ref.invalidate(byokKeysProvider);
    return key;
  }

  Future<void> deleteKey(String id) async {
    final repo = _ref.read(byokRepositoryProvider);
    await repo.delete(id);
    _ref.invalidate(byokKeysProvider);
  }

  Future<ByokKey> setEnabled({
    required String id,
    required bool isEnabled,
  }) async {
    final repo = _ref.read(byokRepositoryProvider);
    final key = await repo.setEnabled(id: id, isEnabled: isEnabled);
    _ref.invalidate(byokKeysProvider);
    return key;
  }

  Future<ByokTestResult> testKey(String id) async {
    final repo = _ref.read(byokRepositoryProvider);
    return repo.testApiKey(id);
  }
}
