// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionInfo _$QuestionInfoFromJson(Map<String, dynamic> json) {
  return _QuestionInfo.fromJson(json);
}

/// @nodoc
mixin _$QuestionInfo {
  String get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  bool? get allowCustom => throw _privateConstructorUsedError;

  /// Serializes this QuestionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionInfoCopyWith<QuestionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionInfoCopyWith<$Res> {
  factory $QuestionInfoCopyWith(
          QuestionInfo value, $Res Function(QuestionInfo) then) =
      _$QuestionInfoCopyWithImpl<$Res, QuestionInfo>;
  @useResult
  $Res call({String id, String? text, List<String> options, bool? allowCustom});
}

/// @nodoc
class _$QuestionInfoCopyWithImpl<$Res, $Val extends QuestionInfo>
    implements $QuestionInfoCopyWith<$Res> {
  _$QuestionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? options = null,
    Object? allowCustom = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowCustom: freezed == allowCustom
          ? _value.allowCustom
          : allowCustom // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionInfoImplCopyWith<$Res>
    implements $QuestionInfoCopyWith<$Res> {
  factory _$$QuestionInfoImplCopyWith(
          _$QuestionInfoImpl value, $Res Function(_$QuestionInfoImpl) then) =
      __$$QuestionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? text, List<String> options, bool? allowCustom});
}

/// @nodoc
class __$$QuestionInfoImplCopyWithImpl<$Res>
    extends _$QuestionInfoCopyWithImpl<$Res, _$QuestionInfoImpl>
    implements _$$QuestionInfoImplCopyWith<$Res> {
  __$$QuestionInfoImplCopyWithImpl(
      _$QuestionInfoImpl _value, $Res Function(_$QuestionInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = freezed,
    Object? options = null,
    Object? allowCustom = freezed,
  }) {
    return _then(_$QuestionInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowCustom: freezed == allowCustom
          ? _value.allowCustom
          : allowCustom // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionInfoImpl implements _QuestionInfo {
  const _$QuestionInfoImpl(
      {required this.id,
      this.text,
      final List<String> options = const [],
      this.allowCustom})
      : _options = options;

  factory _$QuestionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String? text;
  final List<String> _options;
  @override
  @JsonKey()
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final bool? allowCustom;

  @override
  String toString() {
    return 'QuestionInfo(id: $id, text: $text, options: $options, allowCustom: $allowCustom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.allowCustom, allowCustom) ||
                other.allowCustom == allowCustom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text,
      const DeepCollectionEquality().hash(_options), allowCustom);

  /// Create a copy of QuestionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionInfoImplCopyWith<_$QuestionInfoImpl> get copyWith =>
      __$$QuestionInfoImplCopyWithImpl<_$QuestionInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionInfoImplToJson(
      this,
    );
  }
}

abstract class _QuestionInfo implements QuestionInfo {
  const factory _QuestionInfo(
      {required final String id,
      final String? text,
      final List<String> options,
      final bool? allowCustom}) = _$QuestionInfoImpl;

  factory _QuestionInfo.fromJson(Map<String, dynamic> json) =
      _$QuestionInfoImpl.fromJson;

  @override
  String get id;
  @override
  String? get text;
  @override
  List<String> get options;
  @override
  bool? get allowCustom;

  /// Create a copy of QuestionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionInfoImplCopyWith<_$QuestionInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionRequest _$QuestionRequestFromJson(Map<String, dynamic> json) {
  return _QuestionRequest.fromJson(json);
}

/// @nodoc
mixin _$QuestionRequest {
  String get requestId => throw _privateConstructorUsedError;
  List<QuestionInfo> get questions => throw _privateConstructorUsedError;

  /// Serializes this QuestionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionRequestCopyWith<QuestionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionRequestCopyWith<$Res> {
  factory $QuestionRequestCopyWith(
          QuestionRequest value, $Res Function(QuestionRequest) then) =
      _$QuestionRequestCopyWithImpl<$Res, QuestionRequest>;
  @useResult
  $Res call({String requestId, List<QuestionInfo> questions});
}

/// @nodoc
class _$QuestionRequestCopyWithImpl<$Res, $Val extends QuestionRequest>
    implements $QuestionRequestCopyWith<$Res> {
  _$QuestionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionRequestImplCopyWith<$Res>
    implements $QuestionRequestCopyWith<$Res> {
  factory _$$QuestionRequestImplCopyWith(_$QuestionRequestImpl value,
          $Res Function(_$QuestionRequestImpl) then) =
      __$$QuestionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requestId, List<QuestionInfo> questions});
}

/// @nodoc
class __$$QuestionRequestImplCopyWithImpl<$Res>
    extends _$QuestionRequestCopyWithImpl<$Res, _$QuestionRequestImpl>
    implements _$$QuestionRequestImplCopyWith<$Res> {
  __$$QuestionRequestImplCopyWithImpl(
      _$QuestionRequestImpl _value, $Res Function(_$QuestionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? questions = null,
  }) {
    return _then(_$QuestionRequestImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionRequestImpl implements _QuestionRequest {
  const _$QuestionRequestImpl(
      {required this.requestId, final List<QuestionInfo> questions = const []})
      : _questions = questions;

  factory _$QuestionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionRequestImplFromJson(json);

  @override
  final String requestId;
  final List<QuestionInfo> _questions;
  @override
  @JsonKey()
  List<QuestionInfo> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuestionRequest(requestId: $requestId, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionRequestImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, requestId, const DeepCollectionEquality().hash(_questions));

  /// Create a copy of QuestionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionRequestImplCopyWith<_$QuestionRequestImpl> get copyWith =>
      __$$QuestionRequestImplCopyWithImpl<_$QuestionRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionRequestImplToJson(
      this,
    );
  }
}

abstract class _QuestionRequest implements QuestionRequest {
  const factory _QuestionRequest(
      {required final String requestId,
      final List<QuestionInfo> questions}) = _$QuestionRequestImpl;

  factory _QuestionRequest.fromJson(Map<String, dynamic> json) =
      _$QuestionRequestImpl.fromJson;

  @override
  String get requestId;
  @override
  List<QuestionInfo> get questions;

  /// Create a copy of QuestionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionRequestImplCopyWith<_$QuestionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
