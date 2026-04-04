import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

/// Holds the current auth token. null = not authenticated.
final authProvider =
    AsyncNotifierProvider<AuthNotifier, String?>(AuthNotifier.new);

class AuthNotifier extends AsyncNotifier<String?> {
  @override
  Future<String?> build() async {
    final repo = ref.read(authRepositoryProvider);
    return repo.getSavedToken();
  }

  Future<void> setToken(String token) async {
    final repo = ref.read(authRepositoryProvider);
    await repo.saveToken(token);
    state = AsyncData(token);
  }

  Future<void> signOut() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.deleteToken();
    state = const AsyncData(null);
  }
}
