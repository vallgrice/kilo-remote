import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../../../core/models/session.dart';
import '../../auth/providers/auth_provider.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final activeSessionsProvider =
    AsyncNotifierProvider<ActiveSessionsNotifier, List<ActiveSession>>(
  ActiveSessionsNotifier.new,
);

class ActiveSessionsNotifier extends AsyncNotifier<List<ActiveSession>> {
  Timer? _autoRefresh;

  @override
  Future<List<ActiveSession>> build() async {
    final token = ref.watch(authProvider).valueOrNull;
    if (token == null) return [];

    ref.onDispose(() => _autoRefresh?.cancel());
    _startAutoRefresh();

    return _fetch();
  }

  Future<List<ActiveSession>> _fetch() async {
    final client = ref.read(apiClientProvider);
    return client.listActiveSessions();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetch());
  }

  void _startAutoRefresh() {
    _autoRefresh?.cancel();
    _autoRefresh = Timer.periodic(const Duration(seconds: 10), (_) async {
      try {
        final sessions = await _fetch();
        state = AsyncData(sessions);
      } catch (_) {
        // Silently fail on auto-refresh
      }
    });
  }
}
