// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usage_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsagePeriodImpl _$$UsagePeriodImplFromJson(Map<String, dynamic> json) =>
    _$UsagePeriodImpl(
      date: json['date'] as String,
      totalCost: (json['totalCost'] as num).toDouble(),
      requestCount: (json['requestCount'] as num).toDouble(),
      totalInputTokens: (json['totalInputTokens'] as num).toDouble(),
      totalOutputTokens: (json['totalOutputTokens'] as num).toDouble(),
      totalCacheWriteTokens:
          (json['totalCacheWriteTokens'] as num?)?.toDouble(),
      totalCacheHitTokens: (json['totalCacheHitTokens'] as num?)?.toDouble(),
      model: json['model'] as String?,
    );

Map<String, dynamic> _$$UsagePeriodImplToJson(_$UsagePeriodImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'totalCost': instance.totalCost,
      'requestCount': instance.requestCount,
      'totalInputTokens': instance.totalInputTokens,
      'totalOutputTokens': instance.totalOutputTokens,
      'totalCacheWriteTokens': instance.totalCacheWriteTokens,
      'totalCacheHitTokens': instance.totalCacheHitTokens,
      'model': instance.model,
    };

_$UserBalanceImpl _$$UserBalanceImplFromJson(Map<String, dynamic> json) =>
    _$UserBalanceImpl(
      balance: (json['balance'] as num).toDouble(),
      isDepleted: json['isDepleted'] as bool,
    );

Map<String, dynamic> _$$UserBalanceImplToJson(_$UserBalanceImpl instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'isDepleted': instance.isDepleted,
    };
