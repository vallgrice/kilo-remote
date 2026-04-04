import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../sessions/providers/sessions_provider.dart';

/// Fetches available models from OpenRouter.
final modelsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) {
  final client = ref.read(apiClientProvider);
  return client.fetchModels();
});

/// Currently selected mode.
final selectedModeProvider = StateProvider<String>((ref) => 'code');

/// Currently selected model.
final selectedModelProvider = StateProvider<String?>((ref) => null);
