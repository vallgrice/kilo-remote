import 'package:freezed_annotation/freezed_annotation.dart';

part 'usage_stats.freezed.dart';
part 'usage_stats.g.dart';

@freezed
class UsagePeriod with _$UsagePeriod {
  const factory UsagePeriod({
    required String date,
    required double totalCost,
    required double requestCount,
    required double totalInputTokens,
    required double totalOutputTokens,
    double? totalCacheWriteTokens,
    double? totalCacheHitTokens,
    String? model,
  }) = _UsagePeriod;

  factory UsagePeriod.fromJson(Map<String, dynamic> json) => _$UsagePeriodFromJson(json);
}

@freezed
class UsageStats with _$UsageStats {
  const factory UsageStats({
    required double totalCost,
    required double requestCount,
    required double totalInputTokens,
    required double totalOutputTokens,
    double? totalCacheWriteTokens,
    double? totalCacheHitTokens,
  }) = _UsageStats;

  const UsageStats._();

  double get totalTokens => totalInputTokens + totalOutputTokens;

  factory UsageStats.fromPeriods(List<UsagePeriod> periods) {
    if (periods.isEmpty) {
      return const UsageStats(
        totalCost: 0,
        requestCount: 0,
        totalInputTokens: 0,
        totalOutputTokens: 0,
      );
    }

    double cacheWrite = 0;
    double cacheHit = 0;
    for (final p in periods) {
      cacheWrite += p.totalCacheWriteTokens ?? 0;
      cacheHit += p.totalCacheHitTokens ?? 0;
    }

    return UsageStats(
      totalCost: periods.fold(0.0, (sum, p) => sum + p.totalCost),
      requestCount: periods.fold(0.0, (sum, p) => sum + p.requestCount),
      totalInputTokens: periods.fold(0.0, (sum, p) => sum + p.totalInputTokens),
      totalOutputTokens: periods.fold(0.0, (sum, p) => sum + p.totalOutputTokens),
      totalCacheWriteTokens: cacheWrite,
      totalCacheHitTokens: cacheHit,
    );
  }
}

@freezed
class UserBalance with _$UserBalance {
  const factory UserBalance({
    required double balance,
    required bool isDepleted,
  }) = _UserBalance;

  factory UserBalance.fromJson(Map<String, dynamic> json) => _$UserBalanceFromJson(json);
}

enum UsagePeriodType { week, month, year, all }
