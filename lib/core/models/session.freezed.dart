// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActiveSession _$ActiveSessionFromJson(Map<String, dynamic> json) {
  return _ActiveSession.fromJson(json);
}

/// @nodoc
mixin _$ActiveSession {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get connectionId => throw _privateConstructorUsedError;
  String? get gitUrl => throw _privateConstructorUsedError;
  String? get gitBranch => throw _privateConstructorUsedError;

  /// Serializes this ActiveSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActiveSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiveSessionCopyWith<ActiveSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveSessionCopyWith<$Res> {
  factory $ActiveSessionCopyWith(
          ActiveSession value, $Res Function(ActiveSession) then) =
      _$ActiveSessionCopyWithImpl<$Res, ActiveSession>;
  @useResult
  $Res call(
      {String id,
      String status,
      String title,
      String connectionId,
      String? gitUrl,
      String? gitBranch});
}

/// @nodoc
class _$ActiveSessionCopyWithImpl<$Res, $Val extends ActiveSession>
    implements $ActiveSessionCopyWith<$Res> {
  _$ActiveSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActiveSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? title = null,
    Object? connectionId = null,
    Object? gitUrl = freezed,
    Object? gitBranch = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      connectionId: null == connectionId
          ? _value.connectionId
          : connectionId // ignore: cast_nullable_to_non_nullable
              as String,
      gitUrl: freezed == gitUrl
          ? _value.gitUrl
          : gitUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gitBranch: freezed == gitBranch
          ? _value.gitBranch
          : gitBranch // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiveSessionImplCopyWith<$Res>
    implements $ActiveSessionCopyWith<$Res> {
  factory _$$ActiveSessionImplCopyWith(
          _$ActiveSessionImpl value, $Res Function(_$ActiveSessionImpl) then) =
      __$$ActiveSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
      String title,
      String connectionId,
      String? gitUrl,
      String? gitBranch});
}

/// @nodoc
class __$$ActiveSessionImplCopyWithImpl<$Res>
    extends _$ActiveSessionCopyWithImpl<$Res, _$ActiveSessionImpl>
    implements _$$ActiveSessionImplCopyWith<$Res> {
  __$$ActiveSessionImplCopyWithImpl(
      _$ActiveSessionImpl _value, $Res Function(_$ActiveSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActiveSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? title = null,
    Object? connectionId = null,
    Object? gitUrl = freezed,
    Object? gitBranch = freezed,
  }) {
    return _then(_$ActiveSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      connectionId: null == connectionId
          ? _value.connectionId
          : connectionId // ignore: cast_nullable_to_non_nullable
              as String,
      gitUrl: freezed == gitUrl
          ? _value.gitUrl
          : gitUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gitBranch: freezed == gitBranch
          ? _value.gitBranch
          : gitBranch // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveSessionImpl implements _ActiveSession {
  const _$ActiveSessionImpl(
      {required this.id,
      required this.status,
      required this.title,
      required this.connectionId,
      this.gitUrl,
      this.gitBranch});

  factory _$ActiveSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final String title;
  @override
  final String connectionId;
  @override
  final String? gitUrl;
  @override
  final String? gitBranch;

  @override
  String toString() {
    return 'ActiveSession(id: $id, status: $status, title: $title, connectionId: $connectionId, gitUrl: $gitUrl, gitBranch: $gitBranch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.connectionId, connectionId) ||
                other.connectionId == connectionId) &&
            (identical(other.gitUrl, gitUrl) || other.gitUrl == gitUrl) &&
            (identical(other.gitBranch, gitBranch) ||
                other.gitBranch == gitBranch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, status, title, connectionId, gitUrl, gitBranch);

  /// Create a copy of ActiveSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveSessionImplCopyWith<_$ActiveSessionImpl> get copyWith =>
      __$$ActiveSessionImplCopyWithImpl<_$ActiveSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveSessionImplToJson(
      this,
    );
  }
}

abstract class _ActiveSession implements ActiveSession {
  const factory _ActiveSession(
      {required final String id,
      required final String status,
      required final String title,
      required final String connectionId,
      final String? gitUrl,
      final String? gitBranch}) = _$ActiveSessionImpl;

  factory _ActiveSession.fromJson(Map<String, dynamic> json) =
      _$ActiveSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String get title;
  @override
  String get connectionId;
  @override
  String? get gitUrl;
  @override
  String? get gitBranch;

  /// Create a copy of ActiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveSessionImplCopyWith<_$ActiveSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionInfo _$SessionInfoFromJson(Map<String, dynamic> json) {
  return _SessionInfo.fromJson(json);
}

/// @nodoc
mixin _$SessionInfo {
  String get id => throw _privateConstructorUsedError;
  String? get parentID => throw _privateConstructorUsedError;

  /// Serializes this SessionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionInfoCopyWith<SessionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionInfoCopyWith<$Res> {
  factory $SessionInfoCopyWith(
          SessionInfo value, $Res Function(SessionInfo) then) =
      _$SessionInfoCopyWithImpl<$Res, SessionInfo>;
  @useResult
  $Res call({String id, String? parentID});
}

/// @nodoc
class _$SessionInfoCopyWithImpl<$Res, $Val extends SessionInfo>
    implements $SessionInfoCopyWith<$Res> {
  _$SessionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentID = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionInfoImplCopyWith<$Res>
    implements $SessionInfoCopyWith<$Res> {
  factory _$$SessionInfoImplCopyWith(
          _$SessionInfoImpl value, $Res Function(_$SessionInfoImpl) then) =
      __$$SessionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? parentID});
}

/// @nodoc
class __$$SessionInfoImplCopyWithImpl<$Res>
    extends _$SessionInfoCopyWithImpl<$Res, _$SessionInfoImpl>
    implements _$$SessionInfoImplCopyWith<$Res> {
  __$$SessionInfoImplCopyWithImpl(
      _$SessionInfoImpl _value, $Res Function(_$SessionInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentID = freezed,
  }) {
    return _then(_$SessionInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: freezed == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionInfoImpl implements _SessionInfo {
  const _$SessionInfoImpl({required this.id, this.parentID});

  factory _$SessionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String? parentID;

  @override
  String toString() {
    return 'SessionInfo(id: $id, parentID: $parentID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentID, parentID) ||
                other.parentID == parentID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, parentID);

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionInfoImplCopyWith<_$SessionInfoImpl> get copyWith =>
      __$$SessionInfoImplCopyWithImpl<_$SessionInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionInfoImplToJson(
      this,
    );
  }
}

abstract class _SessionInfo implements SessionInfo {
  const factory _SessionInfo(
      {required final String id, final String? parentID}) = _$SessionInfoImpl;

  factory _SessionInfo.fromJson(Map<String, dynamic> json) =
      _$SessionInfoImpl.fromJson;

  @override
  String get id;
  @override
  String? get parentID;

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionInfoImplCopyWith<_$SessionInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
