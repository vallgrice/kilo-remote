// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageTime _$MessageTimeFromJson(Map<String, dynamic> json) {
  return _MessageTime.fromJson(json);
}

/// @nodoc
mixin _$MessageTime {
  int? get created => throw _privateConstructorUsedError;
  int? get completed => throw _privateConstructorUsedError;

  /// Serializes this MessageTime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageTimeCopyWith<MessageTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageTimeCopyWith<$Res> {
  factory $MessageTimeCopyWith(
          MessageTime value, $Res Function(MessageTime) then) =
      _$MessageTimeCopyWithImpl<$Res, MessageTime>;
  @useResult
  $Res call({int? created, int? completed});
}

/// @nodoc
class _$MessageTimeCopyWithImpl<$Res, $Val extends MessageTime>
    implements $MessageTimeCopyWith<$Res> {
  _$MessageTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageTimeImplCopyWith<$Res>
    implements $MessageTimeCopyWith<$Res> {
  factory _$$MessageTimeImplCopyWith(
          _$MessageTimeImpl value, $Res Function(_$MessageTimeImpl) then) =
      __$$MessageTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? created, int? completed});
}

/// @nodoc
class __$$MessageTimeImplCopyWithImpl<$Res>
    extends _$MessageTimeCopyWithImpl<$Res, _$MessageTimeImpl>
    implements _$$MessageTimeImplCopyWith<$Res> {
  __$$MessageTimeImplCopyWithImpl(
      _$MessageTimeImpl _value, $Res Function(_$MessageTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$MessageTimeImpl(
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageTimeImpl implements _MessageTime {
  const _$MessageTimeImpl({this.created, this.completed});

  factory _$MessageTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageTimeImplFromJson(json);

  @override
  final int? created;
  @override
  final int? completed;

  @override
  String toString() {
    return 'MessageTime(created: $created, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageTimeImpl &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, created, completed);

  /// Create a copy of MessageTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageTimeImplCopyWith<_$MessageTimeImpl> get copyWith =>
      __$$MessageTimeImplCopyWithImpl<_$MessageTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageTimeImplToJson(
      this,
    );
  }
}

abstract class _MessageTime implements MessageTime {
  const factory _MessageTime({final int? created, final int? completed}) =
      _$MessageTimeImpl;

  factory _MessageTime.fromJson(Map<String, dynamic> json) =
      _$MessageTimeImpl.fromJson;

  @override
  int? get created;
  @override
  int? get completed;

  /// Create a copy of MessageTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageTimeImplCopyWith<_$MessageTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageInfo _$MessageInfoFromJson(Map<String, dynamic> json) {
  return _MessageInfo.fromJson(json);
}

/// @nodoc
mixin _$MessageInfo {
  String get id => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get sessionID => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  MessageTime? get time => throw _privateConstructorUsedError;
  String? get parentID => throw _privateConstructorUsedError;

  /// Serializes this MessageInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageInfoCopyWith<MessageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageInfoCopyWith<$Res> {
  factory $MessageInfoCopyWith(
          MessageInfo value, $Res Function(MessageInfo) then) =
      _$MessageInfoCopyWithImpl<$Res, MessageInfo>;
  @useResult
  $Res call(
      {String id,
      String role,
      String sessionID,
      double cost,
      String? error,
      MessageTime? time,
      String? parentID});

  $MessageTimeCopyWith<$Res>? get time;
}

/// @nodoc
class _$MessageInfoCopyWithImpl<$Res, $Val extends MessageInfo>
    implements $MessageInfoCopyWith<$Res> {
  _$MessageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? sessionID = null,
    Object? cost = null,
    Object? error = freezed,
    Object? time = freezed,
    Object? parentID = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as MessageTime?,
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of MessageInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageTimeCopyWith<$Res>? get time {
    if (_value.time == null) {
      return null;
    }

    return $MessageTimeCopyWith<$Res>(_value.time!, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageInfoImplCopyWith<$Res>
    implements $MessageInfoCopyWith<$Res> {
  factory _$$MessageInfoImplCopyWith(
          _$MessageInfoImpl value, $Res Function(_$MessageInfoImpl) then) =
      __$$MessageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String role,
      String sessionID,
      double cost,
      String? error,
      MessageTime? time,
      String? parentID});

  @override
  $MessageTimeCopyWith<$Res>? get time;
}

/// @nodoc
class __$$MessageInfoImplCopyWithImpl<$Res>
    extends _$MessageInfoCopyWithImpl<$Res, _$MessageInfoImpl>
    implements _$$MessageInfoImplCopyWith<$Res> {
  __$$MessageInfoImplCopyWithImpl(
      _$MessageInfoImpl _value, $Res Function(_$MessageInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? sessionID = null,
    Object? cost = null,
    Object? error = freezed,
    Object? time = freezed,
    Object? parentID = freezed,
  }) {
    return _then(_$MessageInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as MessageTime?,
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageInfoImpl implements _MessageInfo {
  const _$MessageInfoImpl(
      {required this.id,
      required this.role,
      required this.sessionID,
      this.cost = 0.0,
      this.error,
      this.time,
      this.parentID});

  factory _$MessageInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String role;
  @override
  final String sessionID;
  @override
  @JsonKey()
  final double cost;
  @override
  final String? error;
  @override
  final MessageTime? time;
  @override
  final String? parentID;

  @override
  String toString() {
    return 'MessageInfo(id: $id, role: $role, sessionID: $sessionID, cost: $cost, error: $error, time: $time, parentID: $parentID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.parentID, parentID) ||
                other.parentID == parentID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, role, sessionID, cost, error, time, parentID);

  /// Create a copy of MessageInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageInfoImplCopyWith<_$MessageInfoImpl> get copyWith =>
      __$$MessageInfoImplCopyWithImpl<_$MessageInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageInfoImplToJson(
      this,
    );
  }
}

abstract class _MessageInfo implements MessageInfo {
  const factory _MessageInfo(
      {required final String id,
      required final String role,
      required final String sessionID,
      final double cost,
      final String? error,
      final MessageTime? time,
      final String? parentID}) = _$MessageInfoImpl;

  factory _MessageInfo.fromJson(Map<String, dynamic> json) =
      _$MessageInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get role;
  @override
  String get sessionID;
  @override
  double get cost;
  @override
  String? get error;
  @override
  MessageTime? get time;
  @override
  String? get parentID;

  /// Create a copy of MessageInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageInfoImplCopyWith<_$MessageInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
