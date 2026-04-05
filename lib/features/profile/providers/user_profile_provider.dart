import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/user_repository.dart';
import '../../../core/models/usage_stats.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final userDataProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  final repo = ref.read(userRepositoryProvider);
  return repo.getUserFromToken();
});

final userProfileProvider = FutureProvider<UserProfile>((ref) async {
  final repo = ref.read(userRepositoryProvider);
  return repo.getUserProfile();
});

final kiloUserIdProvider = Provider<String?>((ref) {
  final userData = ref.watch(userDataProvider).valueOrNull;
  if (userData == null) return null;
  return userData['kiloUserId'] as String?;
});

final userBalanceProvider = FutureProvider<UserBalance>((ref) async {
  final repo = ref.read(userRepositoryProvider);
  return repo.getBalance();
});

final usageStatsProvider = FutureProvider.family<UsageStats, UsagePeriodType>((ref, period) async {
  final repo = ref.read(userRepositoryProvider);
  final periods = await repo.getUsageStats(period: period);
  return UsageStats.fromPeriods(periods);
});

final selectedUsagePeriodProvider = StateProvider<UsagePeriodType>((ref) {
  return UsagePeriodType.week;
});

final currentUsageStatsProvider = FutureProvider<UsageStats>((ref) async {
  final period = ref.watch(selectedUsagePeriodProvider);
  final repo = ref.read(userRepositoryProvider);
  final periods = await repo.getUsageStats(period: period);
  return UsageStats.fromPeriods(periods);
});

final usagePeriodsProvider = FutureProvider.family<List<UsagePeriod>, ({UsagePeriodType period, bool groupByModel})>((ref, params) async {
  final repo = ref.read(userRepositoryProvider);
  return repo.getUsageStats(period: params.period, groupByModel: params.groupByModel);
});
