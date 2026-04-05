// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usage_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsagePeriod _$UsagePeriodFromJson(Map<String, dynamic> json) {
  return _UsagePeriod.fromJson(json);
}

/// @nodoc
mixin _$UsagePeriod {
  String get date => throw _privateConstructorUsedError;
  double get totalCost => throw _privateConstructorUsedError;
  double get requestCount => throw _privateConstructorUsedError;
  double get totalInputTokens => throw _privateConstructorUsedError;
  double get totalOutputTokens => throw _privateConstructorUsedError;
  double? get totalCacheWriteTokens => throw _privateConstructorUsedError;
  double? get totalCacheHitTokens => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;

  /// Serializes this UsagePeriod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsagePeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsagePeriodCopyWith<UsagePeriod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsagePeriodCopyWith<$Res> {
  factory $UsagePeriodCopyWith(
          UsagePeriod value, $Res Function(UsagePeriod) then) =
      _$UsagePeriodCopyWithImpl<$Res, UsagePeriod>;
  @useResult
  $Res call(
      {String date,
      double totalCost,
      double requestCount,
      double totalInputTokens,
      double totalOutputTokens,
      double? totalCacheWriteTokens,
      double? totalCacheHitTokens,
      String? model});
}

/// @nodoc
class _$UsagePeriodCopyWithImpl<$Res, $Val extends UsagePeriod>
    implements $UsagePeriodCopyWith<$Res> {
  _$UsagePeriodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsagePeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalCost = null,
    Object? requestCount = null,
    Object? totalInputTokens = null,
    Object? totalOutputTokens = null,
    Object? totalCacheWriteTokens = freezed,
    Object? totalCacheHitTokens = freezed,
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      requestCount: null == requestCount
          ? _value.requestCount
          : requestCount // ignore: cast_nullable_to_non_nullable
              as double,
      totalInputTokens: null == totalInputTokens
          ? _value.totalInputTokens
          : totalInputTokens // ignore: cast_nullable_to_non_nullable
              as double,
      totalOutputTokens: null == totalOutputTokens
          ? _value.totalOutputTokens
          : totalOutputTokens // ignore: cast_nullable_to_non_nullable
              as double,
      totalCacheWriteTokens: freezed == totalCacheWriteTokens
          ? _value.totalCacheWriteTokens
          : totalCacheWriteTokens // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCacheHitTokens: freezed == totalCacheHitTokens
          ? _value.totalCacheHitTokens
          : totalCacheHitTokens // ignore: cast_nullable_to_non_nullable
              as double?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsagePeriodImplCopyWith<$Res>
    implements $UsagePeriodCopyWith<$Res> {
  factory _$$UsagePeriodImplCopyWith(
          _$UsagePeriodImpl value, $Res Function(_$UsagePeriodImpl) then) =
      __$$UsagePeriodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      double totalCost,
      double requestCount,
      double totalInputTokens,
      double totalOutputTokens,
      double? totalCacheWriteTokens,
      double? totalCacheHitTokens,
      String? model});
}

/// @nodoc
class __$$UsagePeriodImplCopyWithImpl<$Res>
    extends _$UsagePeriodCopyWithImpl<$Res, _$UsagePeriodImpl>
    implements _$$UsagePeriodImplCopyWith<$Res> {
  __$$UsagePeriodImplCopyWithImpl(
      _$UsagePeriodImpl _value, $Res Function(_$UsagePeriodImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsagePeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalCost = null,
    Object? requestCount = null,
    Object? totalInputTokens = null,
    Object? totalOutputTokens = null,
    Object? totalCacheWriteTokens = freezed,
    Object? totalCacheHitTokens = freezed,
    Object? model = freezed,
  }) {
    return _then(_$UsagePeriodImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      requestCount: null == requestCount
          ? _value.requestCount
          : requestCount // ignore: cast_nullable_to_non_nullable
              as double,
      totalInputTokens: null == totalInputTokens
          ? _value.totalInputTokens
          : totalInputTokens // ignore: cast_nullable_to_non_nullable
              as double,
      totalOutputTokens: null == totalOutputTokens
          ? _value.totalOutputTokens
          : totalOutputTokens // ignore: cast_nullable_to_non_nullable
              as double,
      totalCacheWriteTokens: freezed == totalCacheWriteTokens
          ? _value.totalCacheWriteTokens
          : totalCacheWriteTokens // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCacheHitTokens: freezed == totalCacheHitTokens
          ? _value.totalCacheHitTokens
          : totalCacheHitTokens // ignore: cast_nullable_to_non_nullable
              as double?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsagePeriodImpl implements _UsagePeriod {
  const _$UsagePeriodImpl(
      {required this.date,
      required this.totalCost,
      required this.requestCount,
      required this.totalInputTokens,
      required this.totalOutputTokens,
      this.totalCacheWriteTokens,
      this.totalCacheHitTokens,
      this.model});

  factory _$UsagePeriodImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsagePeriodImplFromJson(json);

  @override
  final String date;
  @override
  final double totalCost;
  @override
  final double requestCount;
  @override
  final double totalInputTokens;
  @override
  final double totalOutputTokens;
  @override
  final double? totalCacheWriteTokens;
  @override
  final double? totalCacheHitTokens;
  @override
  final String? model;

  @override
  String toString() {
    return 'UsagePeriod(date: $date, totalCost: $totalCost, requestCount: $requestCount, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheWriteTokens: $totalCacheWriteTokens, totalCacheHitTokens: $totalCacheHitTokens, model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsagePeriodImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.requestCount, requestCount) ||
                other.requestCount == requestCount) &&
            (identical(other.totalInputTokens, totalInputTokens) ||
                other.totalInputTokens == totalInputTokens) &&
            (identical(other.totalOutputTokens, totalOutputTokens) ||
                other.totalOutputTokens == totalOutputTokens) &&
            (identical(other.totalCacheWriteTokens, totalCacheWriteTokens) ||
                other.totalCacheWriteTokens == totalCacheWriteTokens) &&
            (identical(other.totalCacheHitTokens, totalCacheHitTokens) ||
                other.totalCacheHitTokens == totalCacheHitTokens) &&
            (identical(other.model, model) || other.model == model));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      totalCost,
      requestCount,
      totalInputTokens,
      totalOutputTokens,
      totalCacheWriteTokens,
      totalCacheHitTokens,
      model);

  /// Create a copy of UsagePeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsagePeriodImplCopyWith<_$UsagePeriodImpl> get copyWith =>
      __$$UsagePeriodImplCopyWithImpl<_$UsagePeriodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsagePeriodImplToJson(
      this,
    );
  }
}

abstract class _UsagePeriod implements UsagePeriod {
  const factory _UsagePeriod(
      {required final String date,
      required final double totalCost,
      required final double requestCount,
      required final double totalInputTokens,
      required final double totalOutputTokens,
      final double? totalCacheWriteTokens,
      final double? totalCacheHitTokens,
      final String? model}) = _$UsagePeriodImpl;

  factory _UsagePeriod.fromJson(Map<String, dynamic> json) =
      _$UsagePeriodImpl.fromJson;

  @override
  String get date;
  @override
  double get totalCost;
  @override
  double get requestCount;
  @override
  double get totalInputTokens;
  @override
  double get totalOutputTokens;
  @override
  double? get totalCacheWriteTokens;
  @override
  double? get totalCacheHitTokens;
  @override
  String? get model;

  /// Create a copy of UsagePeriod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsagePeriodImplCopyWith<_$UsagePeriodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UsageStats {
  double get totalCost => throw _privateConstructorUsedError;
  double get requestCount => throw _privateConstructorUsedError;
  double get totalInputTokens => throw _privateConstructorUsedError;
  double get totalOutputTokens => throw _privateConstructorUsedError;
  double? get totalCacheWriteTokens => throw _privateConstructorUsedError;
  double? get totalCacheHitTokens => throw _privateConstructorUsedError;

  /// Create a copy of UsageStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsageStatsCopyWith<UsageStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageStatsCopyWith<$Res> {
  factory $UsageStatsCopyWith(
          UsageStats value, $Res Function(UsageStats) then) =
      _$UsageStatsCopyWithImpl<$Res, UsageStats>;
  @useResult
  $Res call(
      {double totalCost,
      double requestCount,
      double totalInputTokens,
      double totalOutputTokens,
      double? totalCacheWriteTokens,
      double? totalCacheHitTokens});
}

/// @nodoc
class _$UsageStatsCopyWithImpl<$Res, $Val extends UsageStats>
    implements $UsageStatsCopyWith<$Res> {
  _$UsageStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsageStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCost = null,
    Object? requestCount = null,
    Object? totalInputTokens = null,
    Object? totalOutputTokens = null,
    Object? totalCacheWriteTokens = freezed,
    Object? totalCacheHitTokens = freezed,
  }) {
    return _then(_value.copyWith(
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      requestCount: null == requestCount
          ? _value.requestCount
          : requestCount // ignore: cast_nullable_to_non_nullable
              as double,
      totalInputTokens: null == totalInputTokens
          ? _value.totalInputTokens
          : totalInputTokens // ignore: cast_nullable_to_non_nullable
              as double,
      totalOutputTokens: null == totalOutputTokens
          ? _value.totalOutputTokens
          : totalOutputTokens // ignore: cast_nullable_to_non_nullable
              as double,
      totalCacheWriteTokens: freezed == totalCacheWriteTokens
          ? _value.totalCacheWriteTokens
          : totalCacheWriteTokens // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCacheHitTokens: freezed == totalCacheHitTokens
          ? _value.totalCacheHitTokens
          : totalCacheHitTokens // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageStatsImplCopyWith<$Res>
    implements $UsageStatsCopyWith<$Res> {
  factory _$$UsageStatsImplCopyWith(
          _$UsageStatsImpl value, $Res Function(_$UsageStatsImpl) then) =
      __$$UsageStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalCost,
      double requestCount,
      double totalInputTokens,
      double totalOutputTokens,
      double? totalCacheWriteTokens,
      double? totalCacheHitTokens});
}

/// @nodoc
class __$$UsageStatsImplCopyWithImpl<$Res>
    extends _$UsageStatsCopyWithImpl<$Res, _$UsageStatsImpl>
    implements _$$UsageStatsImplCopyWith<$Res> {
  __$$UsageStatsImplCopyWithImpl(
      _$UsageStatsImpl _value, $Res Function(_$UsageStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsageStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCost = null,
    Object? requestCount = null,
    Object? totalInputTokens = null,
    Object? totalOutputTokens = null,
    Object? totalCacheWriteTokens = freezed,
    Object? totalCacheHitTokens = freezed,
  }) {
    return _then(_$UsageStatsImpl(
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      requestCount: null == requestCount
          ? _value.requestCount
          : requestCount // ignore: cast_nullable_to_non_nullable
              as double,
      totalInputTokens: null == totalInputTokens
          ? _value.totalInputTokens
          : totalInputTokens // ignore: cast_nullable_to_non_nullable
              as double,
      totalOutputTokens: null == totalOutputTokens
          ? _value.totalOutputTokens
          : totalOutputTokens // ignore: cast_nullable_to_non_nullable
              as double,
      totalCacheWriteTokens: freezed == totalCacheWriteTokens
          ? _value.totalCacheWriteTokens
          : totalCacheWriteTokens // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCacheHitTokens: freezed == totalCacheHitTokens
          ? _value.totalCacheHitTokens
          : totalCacheHitTokens // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$UsageStatsImpl extends _UsageStats {
  const _$UsageStatsImpl(
      {required this.totalCost,
      required this.requestCount,
      required this.totalInputTokens,
      required this.totalOutputTokens,
      this.totalCacheWriteTokens,
      this.totalCacheHitTokens})
      : super._();

  @override
  final double totalCost;
  @override
  final double requestCount;
  @override
  final double totalInputTokens;
  @override
  final double totalOutputTokens;
  @override
  final double? totalCacheWriteTokens;
  @override
  final double? totalCacheHitTokens;

  @override
  String toString() {
    return 'UsageStats(totalCost: $totalCost, requestCount: $requestCount, totalInputTokens: $totalInputTokens, totalOutputTokens: $totalOutputTokens, totalCacheWriteTokens: $totalCacheWriteTokens, totalCacheHitTokens: $totalCacheHitTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageStatsImpl &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.requestCount, requestCount) ||
                other.requestCount == requestCount) &&
            (identical(other.totalInputTokens, totalInputTokens) ||
                other.totalInputTokens == totalInputTokens) &&
            (identical(other.totalOutputTokens, totalOutputTokens) ||
                other.totalOutputTokens == totalOutputTokens) &&
            (identical(other.totalCacheWriteTokens, totalCacheWriteTokens) ||
                other.totalCacheWriteTokens == totalCacheWriteTokens) &&
            (identical(other.totalCacheHitTokens, totalCacheHitTokens) ||
                other.totalCacheHitTokens == totalCacheHitTokens));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalCost,
      requestCount,
      totalInputTokens,
      totalOutputTokens,
      totalCacheWriteTokens,
      totalCacheHitTokens);

  /// Create a copy of UsageStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageStatsImplCopyWith<_$UsageStatsImpl> get copyWith =>
      __$$UsageStatsImplCopyWithImpl<_$UsageStatsImpl>(this, _$identity);
}

abstract class _UsageStats extends UsageStats {
  const factory _UsageStats(
      {required final double totalCost,
      required final double requestCount,
      required final double totalInputTokens,
      required final double totalOutputTokens,
      final double? totalCacheWriteTokens,
      final double? totalCacheHitTokens}) = _$UsageStatsImpl;
  const _UsageStats._() : super._();

  @override
  double get totalCost;
  @override
  double get requestCount;
  @override
  double get totalInputTokens;
  @override
  double get totalOutputTokens;
  @override
  double? get totalCacheWriteTokens;
  @override
  double? get totalCacheHitTokens;

  /// Create a copy of UsageStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsageStatsImplCopyWith<_$UsageStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserBalance _$UserBalanceFromJson(Map<String, dynamic> json) {
  return _UserBalance.fromJson(json);
}

/// @nodoc
mixin _$UserBalance {
  double get balance => throw _privateConstructorUsedError;
  bool get isDepleted => throw _privateConstructorUsedError;

  /// Serializes this UserBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBalanceCopyWith<UserBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBalanceCopyWith<$Res> {
  factory $UserBalanceCopyWith(
          UserBalance value, $Res Function(UserBalance) then) =
      _$UserBalanceCopyWithImpl<$Res, UserBalance>;
  @useResult
  $Res call({double balance, bool isDepleted});
}

/// @nodoc
class _$UserBalanceCopyWithImpl<$Res, $Val extends UserBalance>
    implements $UserBalanceCopyWith<$Res> {
  _$UserBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? isDepleted = null,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      isDepleted: null == isDepleted
          ? _value.isDepleted
          : isDepleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBalanceImplCopyWith<$Res>
    implements $UserBalanceCopyWith<$Res> {
  factory _$$UserBalanceImplCopyWith(
          _$UserBalanceImpl value, $Res Function(_$UserBalanceImpl) then) =
      __$$UserBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double balance, bool isDepleted});
}

/// @nodoc
class __$$UserBalanceImplCopyWithImpl<$Res>
    extends _$UserBalanceCopyWithImpl<$Res, _$UserBalanceImpl>
    implements _$$UserBalanceImplCopyWith<$Res> {
  __$$UserBalanceImplCopyWithImpl(
      _$UserBalanceImpl _value, $Res Function(_$UserBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? isDepleted = null,
  }) {
    return _then(_$UserBalanceImpl(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      isDepleted: null == isDepleted
          ? _value.isDepleted
          : isDepleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBalanceImpl implements _UserBalance {
  const _$UserBalanceImpl({required this.balance, required this.isDepleted});

  factory _$UserBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBalanceImplFromJson(json);

  @override
  final double balance;
  @override
  final bool isDepleted;

  @override
  String toString() {
    return 'UserBalance(balance: $balance, isDepleted: $isDepleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBalanceImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.isDepleted, isDepleted) ||
                other.isDepleted == isDepleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, balance, isDepleted);

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBalanceImplCopyWith<_$UserBalanceImpl> get copyWith =>
      __$$UserBalanceImplCopyWithImpl<_$UserBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBalanceImplToJson(
      this,
    );
  }
}

abstract class _UserBalance implements UserBalance {
  const factory _UserBalance(
      {required final double balance,
      required final bool isDepleted}) = _$UserBalanceImpl;

  factory _UserBalance.fromJson(Map<String, dynamic> json) =
      _$UserBalanceImpl.fromJson;

  @override
  double get balance;
  @override
  bool get isDepleted;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBalanceImplCopyWith<_$UserBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
