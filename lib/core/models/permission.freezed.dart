// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermissionRequest _$PermissionRequestFromJson(Map<String, dynamic> json) {
  return _PermissionRequest.fromJson(json);
}

/// @nodoc
mixin _$PermissionRequest {
  String get requestId => throw _privateConstructorUsedError;
  String get permission => throw _privateConstructorUsedError;
  List<String> get patterns => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  List<String> get always => throw _privateConstructorUsedError;

  /// Serializes this PermissionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionRequestCopyWith<PermissionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionRequestCopyWith<$Res> {
  factory $PermissionRequestCopyWith(
          PermissionRequest value, $Res Function(PermissionRequest) then) =
      _$PermissionRequestCopyWithImpl<$Res, PermissionRequest>;
  @useResult
  $Res call(
      {String requestId,
      String permission,
      List<String> patterns,
      Map<String, dynamic> metadata,
      List<String> always});
}

/// @nodoc
class _$PermissionRequestCopyWithImpl<$Res, $Val extends PermissionRequest>
    implements $PermissionRequestCopyWith<$Res> {
  _$PermissionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? permission = null,
    Object? patterns = null,
    Object? metadata = null,
    Object? always = null,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as String,
      patterns: null == patterns
          ? _value.patterns
          : patterns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      always: null == always
          ? _value.always
          : always // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionRequestImplCopyWith<$Res>
    implements $PermissionRequestCopyWith<$Res> {
  factory _$$PermissionRequestImplCopyWith(_$PermissionRequestImpl value,
          $Res Function(_$PermissionRequestImpl) then) =
      __$$PermissionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String requestId,
      String permission,
      List<String> patterns,
      Map<String, dynamic> metadata,
      List<String> always});
}

/// @nodoc
class __$$PermissionRequestImplCopyWithImpl<$Res>
    extends _$PermissionRequestCopyWithImpl<$Res, _$PermissionRequestImpl>
    implements _$$PermissionRequestImplCopyWith<$Res> {
  __$$PermissionRequestImplCopyWithImpl(_$PermissionRequestImpl _value,
      $Res Function(_$PermissionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? permission = null,
    Object? patterns = null,
    Object? metadata = null,
    Object? always = null,
  }) {
    return _then(_$PermissionRequestImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as String,
      patterns: null == patterns
          ? _value._patterns
          : patterns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      always: null == always
          ? _value._always
          : always // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionRequestImpl implements _PermissionRequest {
  const _$PermissionRequestImpl(
      {required this.requestId,
      required this.permission,
      final List<String> patterns = const [],
      final Map<String, dynamic> metadata = const {},
      final List<String> always = const []})
      : _patterns = patterns,
        _metadata = metadata,
        _always = always;

  factory _$PermissionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionRequestImplFromJson(json);

  @override
  final String requestId;
  @override
  final String permission;
  final List<String> _patterns;
  @override
  @JsonKey()
  List<String> get patterns {
    if (_patterns is EqualUnmodifiableListView) return _patterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patterns);
  }

  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  final List<String> _always;
  @override
  @JsonKey()
  List<String> get always {
    if (_always is EqualUnmodifiableListView) return _always;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_always);
  }

  @override
  String toString() {
    return 'PermissionRequest(requestId: $requestId, permission: $permission, patterns: $patterns, metadata: $metadata, always: $always)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionRequestImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            const DeepCollectionEquality().equals(other._patterns, _patterns) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality().equals(other._always, _always));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestId,
      permission,
      const DeepCollectionEquality().hash(_patterns),
      const DeepCollectionEquality().hash(_metadata),
      const DeepCollectionEquality().hash(_always));

  /// Create a copy of PermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionRequestImplCopyWith<_$PermissionRequestImpl> get copyWith =>
      __$$PermissionRequestImplCopyWithImpl<_$PermissionRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionRequestImplToJson(
      this,
    );
  }
}

abstract class _PermissionRequest implements PermissionRequest {
  const factory _PermissionRequest(
      {required final String requestId,
      required final String permission,
      final List<String> patterns,
      final Map<String, dynamic> metadata,
      final List<String> always}) = _$PermissionRequestImpl;

  factory _PermissionRequest.fromJson(Map<String, dynamic> json) =
      _$PermissionRequestImpl.fromJson;

  @override
  String get requestId;
  @override
  String get permission;
  @override
  List<String> get patterns;
  @override
  Map<String, dynamic> get metadata;
  @override
  List<String> get always;

  /// Create a copy of PermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionRequestImplCopyWith<_$PermissionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
