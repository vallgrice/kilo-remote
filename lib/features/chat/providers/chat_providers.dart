import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../sessions/providers/sessions_provider.dart';

/// Fetches available models from OpenRouter.
final modelsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) {
  final client = ref.read(apiClientProvider);
  return client.fetchModels();
});

/// SharedPreferences provider
final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences not initialized');
});

/// Key for storing selected model
const _selectedModelKey = 'selected_model';

/// Default model when none is explicitly selected.
const defaultModelId = 'kilo-auto/frontier';

/// Notifier for selected model that persists to SharedPreferences
class SelectedModelNotifier extends StateNotifier<String?> {
  final SharedPreferences _prefs;

  SelectedModelNotifier(this._prefs) : super(_prefs.getString(_selectedModelKey) ?? defaultModelId);

  void setModel(String? modelId) {
    state = modelId;
    if (modelId != null) {
      _prefs.setString(_selectedModelKey, modelId);
    } else {
      _prefs.remove(_selectedModelKey);
    }
  }
}

/// Provider for selected model with persistence
final selectedModelProvider = StateNotifierProvider<SelectedModelNotifier, String?>((ref) {
  final prefs = ref.watch(sharedPrefsProvider);
  return SelectedModelNotifier(prefs);
});

/// Currently selected mode.
final selectedModeProvider = StateProvider<String>((ref) => 'code');
