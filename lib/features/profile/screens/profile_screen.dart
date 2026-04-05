import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_profile_provider.dart';
import '../data/user_repository.dart';
import '../../../core/models/usage_stats.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/utils/snackbar_utils.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileAsync = ref.watch(userProfileProvider);
    final balanceAsync = ref.watch(userBalanceProvider);
    final selectedPeriod = ref.watch(selectedUsagePeriodProvider);
    final usageAsync = ref.watch(currentUsageStatsProvider);
    final usagePeriodsAsync = ref.watch(usagePeriodsProvider((period: selectedPeriod, groupByModel: false)));

    return Scaffold(
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async {
          ref.invalidate(userProfileProvider);
          ref.invalidate(userBalanceProvider);
          ref.invalidate(currentUsageStatsProvider);
          ref.invalidate(usagePeriodsProvider((period: selectedPeriod, groupByModel: false)));
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildUserProfileSection(context, userProfileAsync),
            const SizedBox(height: 24),
            _buildBalanceSection(context, balanceAsync),
            const SizedBox(height: 24),
            _buildUsageStatsSection(context, ref, selectedPeriod, usageAsync),
            const SizedBox(height: 24),
            _buildCalendarSection(context, ref, selectedPeriod, usagePeriodsAsync),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfileSection(BuildContext context, AsyncValue<UserProfile> userProfileAsync) {
    return userProfileAsync.when(
      loading: () => _buildCard(
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showAppSnackbar(
            context,
            message: 'Failed to load profile: $e',
            type: SnackbarType.error,
          );
        });
        return EmptyState(
          type: EmptyStateType.usage,
          customTitle: 'Failed to load profile',
          useIllustration: true,
        );
      },
      data: (profile) {
        return Row(
          children: [
            if (profile.image.isNotEmpty)
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(profile.image),
                backgroundColor: AppColors.surface,
              )
            else
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primary,
                child: Text(
                  profile.name.isNotEmpty ? profile.name[0].toUpperCase() : '?',
                  style: const TextStyle(
                    color: AppColors.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    profile.email,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
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

  Widget _buildBalanceSection(BuildContext context, AsyncValue<UserBalance> balanceAsync) {
    return balanceAsync.when(
      loading: () => _buildCard(
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showAppSnackbar(
            context,
            message: 'Failed to load balance: $e',
            type: SnackbarType.error,
          );
        });
        return _buildCard(
          child: EmptyState(
            type: EmptyStateType.usage,
            customTitle: 'Failed to load balance',
            useIllustration: true,
          ),
        );
      },
      data: (balance) {
        return _buildCard(
          child: Row(
            children: [
              Text(
                '\$${balance.balance.toStringAsFixed(2)}',
                style: TextStyle(
                  color: balance.isDepleted ? AppColors.error : AppColors.success,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              if (balance.isDepleted)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Depleted',
                    style: TextStyle(color: AppColors.error, fontSize: 12),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUsageStatsSection(
    BuildContext context,
    WidgetRef ref,
    UsagePeriodType selectedPeriod,
    AsyncValue<UsageStats> usageAsync,
  ) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Usage',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              _buildPeriodSelector(ref, selectedPeriod),
            ],
          ),
          const SizedBox(height: 16),
          usageAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showAppSnackbar(
                  context,
                  message: 'Failed to load usage: $e',
                  type: SnackbarType.error,
                );
              });
              return EmptyState(
                type: EmptyStateType.usage,
                customTitle: 'Failed to load usage',
                useIllustration: true,
              );
            },
            data: (stats) => _buildUsageStats(stats),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarSection(
    BuildContext context,
    WidgetRef ref,
    UsagePeriodType selectedPeriod,
    AsyncValue<List<UsagePeriod>> usagePeriodsAsync,
  ) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Daily Requests',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          usagePeriodsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showAppSnackbar(
                  context,
                  message: 'Failed to load calendar: $e',
                  type: SnackbarType.error,
                );
              });
              return EmptyState(
                type: EmptyStateType.usage,
                customTitle: 'Failed to load calendar',
                useIllustration: true,
              );
            },
            data: (periods) => _buildStreakCalendar(periods, selectedPeriod),
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodSelector(WidgetRef ref, UsagePeriodType selected) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: UsagePeriodType.values.map((period) {
        final isSelected = period == selected;
        return Padding(
          padding: const EdgeInsets.only(left: 4),
          child: GestureDetector(
            onTap: () => ref.read(selectedUsagePeriodProvider.notifier).state = period,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                ),
              ),
              child: Text(
                period.name.toUpperCase(),
                style: TextStyle(
                  color: isSelected ? AppColors.onPrimary : AppColors.textSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStreakCalendar(List<UsagePeriod> periods, UsagePeriodType period) {
    final usageByDate = <String, double>{};
    for (final p in periods) {
      final existing = usageByDate[p.date] ?? 0;
      usageByDate[p.date] = existing + p.requestCount;
    }

    final today = DateTime.now();
    final data = _generateStreakData(usageByDate, today, 84);
    
    if (data.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          'No usage data for this period',
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCalendarGrid(data),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: _buildLegend(),
        ),
      ],
    );
  }

  List<_CalendarDay> _generateStreakData(Map<String, double> usageByDate, DateTime today, int days) {
    final result = <_CalendarDay>[];
    for (int i = days - 1; i >= 0; i--) {
      final date = today.subtract(Duration(days: i));
      final dateStr = _formatDateKey(date);
      result.add(_CalendarDay(
        date: date,
        dateStr: dateStr,
        count: usageByDate[dateStr] ?? 0,
      ));
    }
    return result;
  }

  String _formatDateKey(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Widget _buildCalendarGrid(List<_CalendarDay> data) {
    final organizedData = _organizeByWeeks(data);
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 16),
              _buildDayLabel('Sun'),
              _buildDayLabel('Mon'),
              _buildDayLabel('Tue'),
              _buildDayLabel('Wed'),
              _buildDayLabel('Thu'),
              _buildDayLabel('Fri'),
              _buildDayLabel('Sat'),
            ],
          ),
          const SizedBox(width: 8),
          ...organizedData.map((week) {
            return Column(
              children: week.map((day) {
                if (day == null) {
                  return const SizedBox(width: 16, height: 16);
                }
                return Tooltip(
                  message: '${_formatDateLabel(day.date)}: ${day.count.toInt()} request${day.count != 1 ? 's' : ''}',
                  child: Container(
                    width: 16,
                    height: 16,
                    margin: const EdgeInsets.only(right: 4, bottom: 4),
                    decoration: BoxDecoration(
                      color: _getUsageColor(day.count),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildDayLabel(String label) {
    return SizedBox(
      height: 16,
      width: 24,
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 10,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  List<_MonthHeader> _getMonthHeaders(List<List<_CalendarDay?>> organizedData) {
    final headers = <_MonthHeader>[];
    String? currentMonth;
    int colspan = 0;
    
    for (final week in organizedData) {
      for (final day in week) {
        if (day == null) continue;
        final month = _getMonthName(day.date.month);
        if (month != currentMonth) {
          if (currentMonth != null && colspan > 0) {
            headers.add(_MonthHeader(month: currentMonth, colspan: colspan));
          }
          currentMonth = month;
          colspan = 1;
        } else {
          colspan++;
        }
      }
    }
    
    if (currentMonth != null && colspan > 0) {
      headers.add(_MonthHeader(month: currentMonth, colspan: colspan));
    }
    
    return headers;
  }

  String _getMonthName(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }

  List<List<_CalendarDay?>> _organizeByWeeks(List<_CalendarDay> data) {
    if (data.isEmpty) return [];
    
    final weeks = <List<_CalendarDay?>>[];
    final firstDayOfWeek = data[0].date.weekday % 7;
    
    var currentWeek = <_CalendarDay?>[];
    for (int i = 0; i < firstDayOfWeek; i++) {
      currentWeek.add(null);
    }
    
    for (final day in data) {
      currentWeek.add(day);
      if (currentWeek.length == 7) {
        weeks.add(currentWeek);
        currentWeek = [];
      }
    }
    
    if (currentWeek.isNotEmpty) {
      while (currentWeek.length < 7) {
        currentWeek.add(null);
      }
      weeks.add(currentWeek);
    }
    
    return weeks;
  }

  String _formatDateLabel(DateTime date) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  Color _getUsageColor(double requests) {
    if (requests <= 0) return const Color(0xFF1e293b);
    if (requests <= 10) return const Color(0xFF452005);
    if (requests <= 30) return const Color(0xFF7c2d12);
    if (requests <= 80) return const Color(0xFFc2410c);
    return const Color(0xFFfb923c);
  }

  Widget _buildLegend() {
    return SizedBox(
      height: 16,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Less', style: TextStyle(color: AppColors.textSecondary, fontSize: 10)),
          const SizedBox(width: 4),
          _buildLegendSquare(const Color(0xFF1e293b)),
          _buildLegendSquare(const Color(0xFF452005)),
          _buildLegendSquare(const Color(0xFF7c2d12)),
          _buildLegendSquare(const Color(0xFFc2410c)),
          _buildLegendSquare(const Color(0xFFfb923c)),
          const SizedBox(width: 4),
          const Text('More', style: TextStyle(color: AppColors.textSecondary, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildLegendSquare(Color color) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildUsageStats(UsageStats stats) {
    final costDollars = stats.totalCost / 1000000;
    return Column(
      children: [
        _buildStatRow('Total Cost', '\$${costDollars.toStringAsFixed(4)}'),
        _buildStatRow('Requests', stats.requestCount.toStringAsFixed(0)),
        _buildStatRow('Input Tokens', _formatTokens(stats.totalInputTokens)),
        _buildStatRow('Output Tokens', _formatTokens(stats.totalOutputTokens)),
        _buildStatRow('Total Tokens', _formatTokens(stats.totalTokens)),
        if (stats.totalCacheWriteTokens != null && stats.totalCacheWriteTokens! > 0)
          _buildStatRow('Cache Write', _formatTokens(stats.totalCacheWriteTokens!)),
        if (stats.totalCacheHitTokens != null && stats.totalCacheHitTokens! > 0)
          _buildStatRow('Cache Hit', _formatTokens(stats.totalCacheHitTokens!)),
      ],
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTokens(double tokens) {
    if (tokens >= 1000000) {
      return '${(tokens / 1000000).toStringAsFixed(2)}M';
    } else if (tokens >= 1000) {
      return '${(tokens / 1000).toStringAsFixed(2)}K';
    }
    return tokens.toStringAsFixed(0);
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }
}

class _CalendarDay {
  final DateTime date;
  final String dateStr;
  final double count;

  _CalendarDay({
    required this.date,
    required this.dateStr,
    required this.count,
  });
}

class _MonthHeader {
  final String month;
  final int colspan;

  _MonthHeader({required this.month, required this.colspan});
}
