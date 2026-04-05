// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ToolState _$ToolStateFromJson(Map<String, dynamic> json) {
  return _ToolState.fromJson(json);
}

/// @nodoc
mixin _$ToolState {
  @JsonKey(unknownEnumValue: ToolStatus.unknown)
  ToolStatus get status => throw _privateConstructorUsedError;
  Map<String, dynamic> get input => throw _privateConstructorUsedError;
  dynamic get output => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this ToolState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ToolState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToolStateCopyWith<ToolState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolStateCopyWith<$Res> {
  factory $ToolStateCopyWith(ToolState value, $Res Function(ToolState) then) =
      _$ToolStateCopyWithImpl<$Res, ToolState>;
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ToolStatus.unknown) ToolStatus status,
      Map<String, dynamic> input,
      dynamic output,
      String? error});
}

/// @nodoc
class _$ToolStateCopyWithImpl<$Res, $Val extends ToolState>
    implements $ToolStateCopyWith<$Res> {
  _$ToolStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ToolState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? input = null,
    Object? output = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ToolStatus,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as dynamic,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToolStateImplCopyWith<$Res>
    implements $ToolStateCopyWith<$Res> {
  factory _$$ToolStateImplCopyWith(
          _$ToolStateImpl value, $Res Function(_$ToolStateImpl) then) =
      __$$ToolStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: ToolStatus.unknown) ToolStatus status,
      Map<String, dynamic> input,
      dynamic output,
      String? error});
}

/// @nodoc
class __$$ToolStateImplCopyWithImpl<$Res>
    extends _$ToolStateCopyWithImpl<$Res, _$ToolStateImpl>
    implements _$$ToolStateImplCopyWith<$Res> {
  __$$ToolStateImplCopyWithImpl(
      _$ToolStateImpl _value, $Res Function(_$ToolStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ToolState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? input = null,
    Object? output = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ToolStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ToolStatus,
      input: null == input
          ? _value._input
          : input // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as dynamic,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolStateImpl implements _ToolState {
  const _$ToolStateImpl(
      {@JsonKey(unknownEnumValue: ToolStatus.unknown) required this.status,
      final Map<String, dynamic> input = const {},
      this.output,
      this.error})
      : _input = input;

  factory _$ToolStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolStateImplFromJson(json);

  @override
  @JsonKey(unknownEnumValue: ToolStatus.unknown)
  final ToolStatus status;
  final Map<String, dynamic> _input;
  @override
  @JsonKey()
  Map<String, dynamic> get input {
    if (_input is EqualUnmodifiableMapView) return _input;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_input);
  }

  @override
  final dynamic output;
  @override
  final String? error;

  @override
  String toString() {
    return 'ToolState(status: $status, input: $input, output: $output, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._input, _input) &&
            const DeepCollectionEquality().equals(other.output, output) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_input),
      const DeepCollectionEquality().hash(output),
      error);

  /// Create a copy of ToolState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolStateImplCopyWith<_$ToolStateImpl> get copyWith =>
      __$$ToolStateImplCopyWithImpl<_$ToolStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolStateImplToJson(
      this,
    );
  }
}

abstract class _ToolState implements ToolState {
  const factory _ToolState(
      {@JsonKey(unknownEnumValue: ToolStatus.unknown)
      required final ToolStatus status,
      final Map<String, dynamic> input,
      final dynamic output,
      final String? error}) = _$ToolStateImpl;

  factory _ToolState.fromJson(Map<String, dynamic> json) =
      _$ToolStateImpl.fromJson;

  @override
  @JsonKey(unknownEnumValue: ToolStatus.unknown)
  ToolStatus get status;
  @override
  Map<String, dynamic> get input;
  @override
  dynamic get output;
  @override
  String? get error;

  /// Create a copy of ToolState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToolStateImplCopyWith<_$ToolStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
