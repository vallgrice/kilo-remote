// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PartTime _$PartTimeFromJson(Map<String, dynamic> json) {
  return _PartTime.fromJson(json);
}

/// @nodoc
mixin _$PartTime {
  int? get start => throw _privateConstructorUsedError;
  int? get end => throw _privateConstructorUsedError;

  /// Serializes this PartTime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PartTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PartTimeCopyWith<PartTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartTimeCopyWith<$Res> {
  factory $PartTimeCopyWith(PartTime value, $Res Function(PartTime) then) =
      _$PartTimeCopyWithImpl<$Res, PartTime>;
  @useResult
  $Res call({int? start, int? end});
}

/// @nodoc
class _$PartTimeCopyWithImpl<$Res, $Val extends PartTime>
    implements $PartTimeCopyWith<$Res> {
  _$PartTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PartTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartTimeImplCopyWith<$Res>
    implements $PartTimeCopyWith<$Res> {
  factory _$$PartTimeImplCopyWith(
          _$PartTimeImpl value, $Res Function(_$PartTimeImpl) then) =
      __$$PartTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? start, int? end});
}

/// @nodoc
class __$$PartTimeImplCopyWithImpl<$Res>
    extends _$PartTimeCopyWithImpl<$Res, _$PartTimeImpl>
    implements _$$PartTimeImplCopyWith<$Res> {
  __$$PartTimeImplCopyWithImpl(
      _$PartTimeImpl _value, $Res Function(_$PartTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PartTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$PartTimeImpl(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartTimeImpl implements _PartTime {
  const _$PartTimeImpl({this.start, this.end});

  factory _$PartTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartTimeImplFromJson(json);

  @override
  final int? start;
  @override
  final int? end;

  @override
  String toString() {
    return 'PartTime(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartTimeImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  /// Create a copy of PartTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartTimeImplCopyWith<_$PartTimeImpl> get copyWith =>
      __$$PartTimeImplCopyWithImpl<_$PartTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartTimeImplToJson(
      this,
    );
  }
}

abstract class _PartTime implements PartTime {
  const factory _PartTime({final int? start, final int? end}) = _$PartTimeImpl;

  factory _PartTime.fromJson(Map<String, dynamic> json) =
      _$PartTimeImpl.fromJson;

  @override
  int? get start;
  @override
  int? get end;

  /// Create a copy of PartTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartTimeImplCopyWith<_$PartTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Part _$PartFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'text':
      return TextPart.fromJson(json);
    case 'tool':
      return ToolPart.fromJson(json);
    case 'reasoning':
      return ReasoningPart.fromJson(json);
    case 'file':
      return FilePart.fromJson(json);
    case 'subtask':
      return SubtaskPart.fromJson(json);
    case 'patch':
      return PatchPart.fromJson(json);
    case 'step-start':
      return StepStartPart.fromJson(json);
    case 'step-finish':
      return StepFinishPart.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'Part', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$Part {
  String get id => throw _privateConstructorUsedError;
  String get sessionID => throw _privateConstructorUsedError;
  String get messageID => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        text,
    required TResult Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)
        tool,
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        reasoning,
    required TResult Function(String id, String sessionID, String messageID,
            String url, String mime, String? filename)
        file,
    required TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)
        subtask,
    required TResult Function(String id, String sessionID, String messageID)
        patch,
    required TResult Function(String id, String sessionID, String messageID)
        stepStart,
    required TResult Function(String id, String sessionID, String messageID)
        stepFinish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        text,
    TResult? Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)?
        tool,
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        reasoning,
    TResult? Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult? Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult? Function(String id, String sessionID, String messageID)? patch,
    TResult? Function(String id, String sessionID, String messageID)? stepStart,
    TResult? Function(String id, String sessionID, String messageID)?
        stepFinish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        text,
    TResult Function(String id, String sessionID, String messageID, String tool,
            ToolState state, PartTime? time)?
        tool,
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        reasoning,
    TResult Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult Function(String id, String sessionID, String messageID)? patch,
    TResult Function(String id, String sessionID, String messageID)? stepStart,
    TResult Function(String id, String sessionID, String messageID)? stepFinish,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextPart value) text,
    required TResult Function(ToolPart value) tool,
    required TResult Function(ReasoningPart value) reasoning,
    required TResult Function(FilePart value) file,
    required TResult Function(SubtaskPart value) subtask,
    required TResult Function(PatchPart value) patch,
    required TResult Function(StepStartPart value) stepStart,
    required TResult Function(StepFinishPart value) stepFinish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextPart value)? text,
    TResult? Function(ToolPart value)? tool,
    TResult? Function(ReasoningPart value)? reasoning,
    TResult? Function(FilePart value)? file,
    TResult? Function(SubtaskPart value)? subtask,
    TResult? Function(PatchPart value)? patch,
    TResult? Function(StepStartPart value)? stepStart,
    TResult? Function(StepFinishPart value)? stepFinish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextPart value)? text,
    TResult Function(ToolPart value)? tool,
    TResult Function(ReasoningPart value)? reasoning,
    TResult Function(FilePart value)? file,
    TResult Function(SubtaskPart value)? subtask,
    TResult Function(PatchPart value)? patch,
    TResult Function(StepStartPart value)? stepStart,
    TResult Function(StepFinishPart value)? stepFinish,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this Part to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PartCopyWith<Part> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartCopyWith<$Res> {
  factory $PartCopyWith(Part value, $Res Function(Part) then) =
      _$PartCopyWithImpl<$Res, Part>;
  @useResult
  $Res call({String id, String sessionID, String messageID});
}

/// @nodoc
class _$PartCopyWithImpl<$Res, $Val extends Part>
    implements $PartCopyWith<$Res> {
  _$PartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionID = null,
    Object? messageID = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      messageID: null == messageID
          ? _value.messageID
          : messageID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextPartImplCopyWith<$Res> implements $PartCopyWith<$Res> {
  factory _$$TextPartImplCopyWith(
          _$TextPartImpl value, $Res Function(_$TextPartImpl) then) =
      __$$TextPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionID,
      String messageID,
      String text,
      PartTime? time});

  $PartTimeCopyWith<$Res>? get time;
}

/// @nodoc
class __$$TextPartImplCopyWithImpl<$Res>
    extends _$PartCopyWithImpl<$Res, _$TextPartImpl>
    implements _$$TextPartImplCopyWith<$Res> {
  __$$TextPartImplCopyWithImpl(
      _$TextPartImpl _value, $Res Function(_$TextPartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionID = null,
    Object? messageID = null,
    Object? text = null,
    Object? time = freezed,
  }) {
    return _then(_$TextPartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      messageID: null == messageID
          ? _value.messageID
          : messageID // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as PartTime?,
    ));
  }

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartTimeCopyWith<$Res>? get time {
    if (_value.time == null) {
      return null;
    }

    return $PartTimeCopyWith<$Res>(_value.time!, (value) {
      return _then(_value.copyWith(time: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TextPartImpl implements TextPart {
  const _$TextPartImpl(
      {required this.id,
      required this.sessionID,
      required this.messageID,
      this.text = '',
      this.time,
      final String? $type})
      : $type = $type ?? 'text';

  factory _$TextPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextPartImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionID;
  @override
  final String messageID;
  @override
  @JsonKey()
  final String text;
  @override
  final PartTime? time;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Part.text(id: $id, sessionID: $sessionID, messageID: $messageID, text: $text, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextPartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.messageID, messageID) ||
                other.messageID == messageID) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sessionID, messageID, text, time);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextPartImplCopyWith<_$TextPartImpl> get copyWith =>
      __$$TextPartImplCopyWithImpl<_$TextPartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        text,
    required TResult Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)
        tool,
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        reasoning,
    required TResult Function(String id, String sessionID, String messageID,
            String url, String mime, String? filename)
        file,
    required TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)
        subtask,
    required TResult Function(String id, String sessionID, String messageID)
        patch,
    required TResult Function(String id, String sessionID, String messageID)
        stepStart,
    required TResult Function(String id, String sessionID, String messageID)
        stepFinish,
  }) {
    return text(id, sessionID, messageID, this.text, time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        text,
    TResult? Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)?
        tool,
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        reasoning,
    TResult? Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult? Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult? Function(String id, String sessionID, String messageID)? patch,
    TResult? Function(String id, String sessionID, String messageID)? stepStart,
    TResult? Function(String id, String sessionID, String messageID)?
        stepFinish,
  }) {
    return text?.call(id, sessionID, messageID, this.text, time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        text,
    TResult Function(String id, String sessionID, String messageID, String tool,
            ToolState state, PartTime? time)?
        tool,
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        reasoning,
    TResult Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult Function(String id, String sessionID, String messageID)? patch,
    TResult Function(String id, String sessionID, String messageID)? stepStart,
    TResult Function(String id, String sessionID, String messageID)? stepFinish,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(id, sessionID, messageID, this.text, time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextPart value) text,
    required TResult Function(ToolPart value) tool,
    required TResult Function(ReasoningPart value) reasoning,
    required TResult Function(FilePart value) file,
    required TResult Function(SubtaskPart value) subtask,
    required TResult Function(PatchPart value) patch,
    required TResult Function(StepStartPart value) stepStart,
    required TResult Function(StepFinishPart value) stepFinish,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextPart value)? text,
    TResult? Function(ToolPart value)? tool,
    TResult? Function(ReasoningPart value)? reasoning,
    TResult? Function(FilePart value)? file,
    TResult? Function(SubtaskPart value)? subtask,
    TResult? Function(PatchPart value)? patch,
    TResult? Function(StepStartPart value)? stepStart,
    TResult? Function(StepFinishPart value)? stepFinish,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextPart value)? text,
    TResult Function(ToolPart value)? tool,
    TResult Function(ReasoningPart value)? reasoning,
    TResult Function(FilePart value)? file,
    TResult Function(SubtaskPart value)? subtask,
    TResult Function(PatchPart value)? patch,
    TResult Function(StepStartPart value)? stepStart,
    TResult Function(StepFinishPart value)? stepFinish,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextPartImplToJson(
      this,
    );
  }
}

abstract class TextPart implements Part {
  const factory TextPart(
      {required final String id,
      required final String sessionID,
      required final String messageID,
      final String text,
      final PartTime? time}) = _$TextPartImpl;

  factory TextPart.fromJson(Map<String, dynamic> json) =
      _$TextPartImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionID;
  @override
  String get messageID;
  String get text;
  PartTime? get time;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextPartImplCopyWith<_$TextPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToolPartImplCopyWith<$Res> implements $PartCopyWith<$Res> {
  factory _$$ToolPartImplCopyWith(
          _$ToolPartImpl value, $Res Function(_$ToolPartImpl) then) =
      __$$ToolPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionID,
      String messageID,
      String tool,
      ToolState state,
      PartTime? time});

  $ToolStateCopyWith<$Res> get state;
  $PartTimeCopyWith<$Res>? get time;
}

/// @nodoc
class __$$ToolPartImplCopyWithImpl<$Res>
    extends _$PartCopyWithImpl<$Res, _$ToolPartImpl>
    implements _$$ToolPartImplCopyWith<$Res> {
  __$$ToolPartImplCopyWithImpl(
      _$ToolPartImpl _value, $Res Function(_$ToolPartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionID = null,
    Object? messageID = null,
    Object? tool = null,
    Object? state = null,
    Object? time = freezed,
  }) {
    return _then(_$ToolPartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      messageID: null == messageID
          ? _value.messageID
          : messageID // ignore: cast_nullable_to_non_nullable
              as String,
      tool: null == tool
          ? _value.tool
          : tool // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ToolState,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as PartTime?,
    ));
  }

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ToolStateCopyWith<$Res> get state {
    return $ToolStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartTimeCopyWith<$Res>? get time {
    if (_value.time == null) {
      return null;
    }

    return $PartTimeCopyWith<$Res>(_value.time!, (value) {
      return _then(_value.copyWith(time: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolPartImpl implements ToolPart {
  const _$ToolPartImpl(
      {required this.id,
      required this.sessionID,
      required this.messageID,
      required this.tool,
      required this.state,
      this.time,
      final String? $type})
      : $type = $type ?? 'tool';

  factory _$ToolPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolPartImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionID;
  @override
  final String messageID;
  @override
  final String tool;
  @override
  final ToolState state;
  @override
  final PartTime? time;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Part.tool(id: $id, sessionID: $sessionID, messageID: $messageID, tool: $tool, state: $state, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolPartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.messageID, messageID) ||
                other.messageID == messageID) &&
            (identical(other.tool, tool) || other.tool == tool) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sessionID, messageID, tool, state, time);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolPartImplCopyWith<_$ToolPartImpl> get copyWith =>
      __$$ToolPartImplCopyWithImpl<_$ToolPartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        text,
    required TResult Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)
        tool,
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        reasoning,
    required TResult Function(String id, String sessionID, String messageID,
            String url, String mime, String? filename)
        file,
    required TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)
        subtask,
    required TResult Function(String id, String sessionID, String messageID)
        patch,
    required TResult Function(String id, String sessionID, String messageID)
        stepStart,
    required TResult Function(String id, String sessionID, String messageID)
        stepFinish,
  }) {
    return tool(id, sessionID, messageID, this.tool, state, time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        text,
    TResult? Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)?
        tool,
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        reasoning,
    TResult? Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult? Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult? Function(String id, String sessionID, String messageID)? patch,
    TResult? Function(String id, String sessionID, String messageID)? stepStart,
    TResult? Function(String id, String sessionID, String messageID)?
        stepFinish,
  }) {
    return tool?.call(id, sessionID, messageID, this.tool, state, time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        text,
    TResult Function(String id, String sessionID, String messageID, String tool,
            ToolState state, PartTime? time)?
        tool,
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        reasoning,
    TResult Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult Function(String id, String sessionID, String messageID)? patch,
    TResult Function(String id, String sessionID, String messageID)? stepStart,
    TResult Function(String id, String sessionID, String messageID)? stepFinish,
    required TResult orElse(),
  }) {
    if (tool != null) {
      return tool(id, sessionID, messageID, this.tool, state, time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextPart value) text,
    required TResult Function(ToolPart value) tool,
    required TResult Function(ReasoningPart value) reasoning,
    required TResult Function(FilePart value) file,
    required TResult Function(SubtaskPart value) subtask,
    required TResult Function(PatchPart value) patch,
    required TResult Function(StepStartPart value) stepStart,
    required TResult Function(StepFinishPart value) stepFinish,
  }) {
    return tool(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextPart value)? text,
    TResult? Function(ToolPart value)? tool,
    TResult? Function(ReasoningPart value)? reasoning,
    TResult? Function(FilePart value)? file,
    TResult? Function(SubtaskPart value)? subtask,
    TResult? Function(PatchPart value)? patch,
    TResult? Function(StepStartPart value)? stepStart,
    TResult? Function(StepFinishPart value)? stepFinish,
  }) {
    return tool?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextPart value)? text,
    TResult Function(ToolPart value)? tool,
    TResult Function(ReasoningPart value)? reasoning,
    TResult Function(FilePart value)? file,
    TResult Function(SubtaskPart value)? subtask,
    TResult Function(PatchPart value)? patch,
    TResult Function(StepStartPart value)? stepStart,
    TResult Function(StepFinishPart value)? stepFinish,
    required TResult orElse(),
  }) {
    if (tool != null) {
      return tool(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolPartImplToJson(
      this,
    );
  }
}

abstract class ToolPart implements Part {
  const factory ToolPart(
      {required final String id,
      required final String sessionID,
      required final String messageID,
      required final String tool,
      required final ToolState state,
      final PartTime? time}) = _$ToolPartImpl;

  factory ToolPart.fromJson(Map<String, dynamic> json) =
      _$ToolPartImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionID;
  @override
  String get messageID;
  String get tool;
  ToolState get state;
  PartTime? get time;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToolPartImplCopyWith<_$ToolPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReasoningPartImplCopyWith<$Res>
    implements $PartCopyWith<$Res> {
  factory _$$ReasoningPartImplCopyWith(
          _$ReasoningPartImpl value, $Res Function(_$ReasoningPartImpl) then) =
      __$$ReasoningPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionID,
      String messageID,
      String text,
      PartTime? time});

  $PartTimeCopyWith<$Res>? get time;
}

/// @nodoc
class __$$ReasoningPartImplCopyWithImpl<$Res>
    extends _$PartCopyWithImpl<$Res, _$ReasoningPartImpl>
    implements _$$ReasoningPartImplCopyWith<$Res> {
  __$$ReasoningPartImplCopyWithImpl(
      _$ReasoningPartImpl _value, $Res Function(_$ReasoningPartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionID = null,
    Object? messageID = null,
    Object? text = null,
    Object? time = freezed,
  }) {
    return _then(_$ReasoningPartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      messageID: null == messageID
          ? _value.messageID
          : messageID // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as PartTime?,
    ));
  }

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartTimeCopyWith<$Res>? get time {
    if (_value.time == null) {
      return null;
    }

    return $PartTimeCopyWith<$Res>(_value.time!, (value) {
      return _then(_value.copyWith(time: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ReasoningPartImpl implements ReasoningPart {
  const _$ReasoningPartImpl(
      {required this.id,
      required this.sessionID,
      required this.messageID,
      this.text = '',
      this.time,
      final String? $type})
      : $type = $type ?? 'reasoning';

  factory _$ReasoningPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReasoningPartImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionID;
  @override
  final String messageID;
  @override
  @JsonKey()
  final String text;
  @override
  final PartTime? time;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Part.reasoning(id: $id, sessionID: $sessionID, messageID: $messageID, text: $text, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReasoningPartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.messageID, messageID) ||
                other.messageID == messageID) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sessionID, messageID, text, time);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReasoningPartImplCopyWith<_$ReasoningPartImpl> get copyWith =>
      __$$ReasoningPartImplCopyWithImpl<_$ReasoningPartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        text,
    required TResult Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)
        tool,
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        reasoning,
    required TResult Function(String id, String sessionID, String messageID,
            String url, String mime, String? filename)
        file,
    required TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)
        subtask,
    required TResult Function(String id, String sessionID, String messageID)
        patch,
    required TResult Function(String id, String sessionID, String messageID)
        stepStart,
    required TResult Function(String id, String sessionID, String messageID)
        stepFinish,
  }) {
    return reasoning(id, sessionID, messageID, this.text, time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        text,
    TResult? Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)?
        tool,
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        reasoning,
    TResult? Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult? Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult? Function(String id, String sessionID, String messageID)? patch,
    TResult? Function(String id, String sessionID, String messageID)? stepStart,
    TResult? Function(String id, String sessionID, String messageID)?
        stepFinish,
  }) {
    return reasoning?.call(id, sessionID, messageID, this.text, time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        text,
    TResult Function(String id, String sessionID, String messageID, String tool,
            ToolState state, PartTime? time)?
        tool,
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        reasoning,
    TResult Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult Function(String id, String sessionID, String messageID)? patch,
    TResult Function(String id, String sessionID, String messageID)? stepStart,
    TResult Function(String id, String sessionID, String messageID)? stepFinish,
    required TResult orElse(),
  }) {
    if (reasoning != null) {
      return reasoning(id, sessionID, messageID, this.text, time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextPart value) text,
    required TResult Function(ToolPart value) tool,
    required TResult Function(ReasoningPart value) reasoning,
    required TResult Function(FilePart value) file,
    required TResult Function(SubtaskPart value) subtask,
    required TResult Function(PatchPart value) patch,
    required TResult Function(StepStartPart value) stepStart,
    required TResult Function(StepFinishPart value) stepFinish,
  }) {
    return reasoning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextPart value)? text,
    TResult? Function(ToolPart value)? tool,
    TResult? Function(ReasoningPart value)? reasoning,
    TResult? Function(FilePart value)? file,
    TResult? Function(SubtaskPart value)? subtask,
    TResult? Function(PatchPart value)? patch,
    TResult? Function(StepStartPart value)? stepStart,
    TResult? Function(StepFinishPart value)? stepFinish,
  }) {
    return reasoning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextPart value)? text,
    TResult Function(ToolPart value)? tool,
    TResult Function(ReasoningPart value)? reasoning,
    TResult Function(FilePart value)? file,
    TResult Function(SubtaskPart value)? subtask,
    TResult Function(PatchPart value)? patch,
    TResult Function(StepStartPart value)? stepStart,
    TResult Function(StepFinishPart value)? stepFinish,
    required TResult orElse(),
  }) {
    if (reasoning != null) {
      return reasoning(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReasoningPartImplToJson(
      this,
    );
  }
}

abstract class ReasoningPart implements Part {
  const factory ReasoningPart(
      {required final String id,
      required final String sessionID,
      required final String messageID,
      final String text,
      final PartTime? time}) = _$ReasoningPartImpl;

  factory ReasoningPart.fromJson(Map<String, dynamic> json) =
      _$ReasoningPartImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionID;
  @override
  String get messageID;
  String get text;
  PartTime? get time;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReasoningPartImplCopyWith<_$ReasoningPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilePartImplCopyWith<$Res> implements $PartCopyWith<$Res> {
  factory _$$FilePartImplCopyWith(
          _$FilePartImpl value, $Res Function(_$FilePartImpl) then) =
      __$$FilePartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionID,
      String messageID,
      String url,
      String mime,
      String? filename});
}

/// @nodoc
class __$$FilePartImplCopyWithImpl<$Res>
    extends _$PartCopyWithImpl<$Res, _$FilePartImpl>
    implements _$$FilePartImplCopyWith<$Res> {
  __$$FilePartImplCopyWithImpl(
      _$FilePartImpl _value, $Res Function(_$FilePartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionID = null,
    Object? messageID = null,
    Object? url = null,
    Object? mime = null,
    Object? filename = freezed,
  }) {
    return _then(_$FilePartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      messageID: null == messageID
          ? _value.messageID
          : messageID // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      mime: null == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilePartImpl implements FilePart {
  const _$FilePartImpl(
      {required this.id,
      required this.sessionID,
      required this.messageID,
      this.url = '',
      this.mime = '',
      this.filename,
      final String? $type})
      : $type = $type ?? 'file';

  factory _$FilePartImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilePartImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionID;
  @override
  final String messageID;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String mime;
  @override
  final String? filename;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Part.file(id: $id, sessionID: $sessionID, messageID: $messageID, url: $url, mime: $mime, filename: $filename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilePartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.messageID, messageID) ||
                other.messageID == messageID) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.filename, filename) ||
                other.filename == filename));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sessionID, messageID, url, mime, filename);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilePartImplCopyWith<_$FilePartImpl> get copyWith =>
      __$$FilePartImplCopyWithImpl<_$FilePartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        text,
    required TResult Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)
        tool,
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        reasoning,
    required TResult Function(String id, String sessionID, String messageID,
            String url, String mime, String? filename)
        file,
    required TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)
        subtask,
    required TResult Function(String id, String sessionID, String messageID)
        patch,
    required TResult Function(String id, String sessionID, String messageID)
        stepStart,
    required TResult Function(String id, String sessionID, String messageID)
        stepFinish,
  }) {
    return file(id, sessionID, messageID, url, mime, filename);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        text,
    TResult? Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)?
        tool,
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        reasoning,
    TResult? Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult? Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult? Function(String id, String sessionID, String messageID)? patch,
    TResult? Function(String id, String sessionID, String messageID)? stepStart,
    TResult? Function(String id, String sessionID, String messageID)?
        stepFinish,
  }) {
    return file?.call(id, sessionID, messageID, url, mime, filename);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        text,
    TResult Function(String id, String sessionID, String messageID, String tool,
            ToolState state, PartTime? time)?
        tool,
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        reasoning,
    TResult Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult Function(String id, String sessionID, String messageID)? patch,
    TResult Function(String id, String sessionID, String messageID)? stepStart,
    TResult Function(String id, String sessionID, String messageID)? stepFinish,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(id, sessionID, messageID, url, mime, filename);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextPart value) text,
    required TResult Function(ToolPart value) tool,
    required TResult Function(ReasoningPart value) reasoning,
    required TResult Function(FilePart value) file,
    required TResult Function(SubtaskPart value) subtask,
    required TResult Function(PatchPart value) patch,
    required TResult Function(StepStartPart value) stepStart,
    required TResult Function(StepFinishPart value) stepFinish,
  }) {
    return file(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextPart value)? text,
    TResult? Function(ToolPart value)? tool,
    TResult? Function(ReasoningPart value)? reasoning,
    TResult? Function(FilePart value)? file,
    TResult? Function(SubtaskPart value)? subtask,
    TResult? Function(PatchPart value)? patch,
    TResult? Function(StepStartPart value)? stepStart,
    TResult? Function(StepFinishPart value)? stepFinish,
  }) {
    return file?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextPart value)? text,
    TResult Function(ToolPart value)? tool,
    TResult Function(ReasoningPart value)? reasoning,
    TResult Function(FilePart value)? file,
    TResult Function(SubtaskPart value)? subtask,
    TResult Function(PatchPart value)? patch,
    TResult Function(StepStartPart value)? stepStart,
    TResult Function(StepFinishPart value)? stepFinish,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FilePartImplToJson(
      this,
    );
  }
}

abstract class FilePart implements Part {
  const factory FilePart(
      {required final String id,
      required final String sessionID,
      required final String messageID,
      final String url,
      final String mime,
      final String? filename}) = _$FilePartImpl;

  factory FilePart.fromJson(Map<String, dynamic> json) =
      _$FilePartImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionID;
  @override
  String get messageID;
  String get url;
  String get mime;
  String? get filename;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilePartImplCopyWith<_$FilePartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubtaskPartImplCopyWith<$Res> implements $PartCopyWith<$Res> {
  factory _$$SubtaskPartImplCopyWith(
          _$SubtaskPartImpl value, $Res Function(_$SubtaskPartImpl) then) =
      __$$SubtaskPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionID,
      String messageID,
      String agent,
      String? description,
      String? prompt});
}

/// @nodoc
class __$$SubtaskPartImplCopyWithImpl<$Res>
    extends _$PartCopyWithImpl<$Res, _$SubtaskPartImpl>
    implements _$$SubtaskPartImplCopyWith<$Res> {
  __$$SubtaskPartImplCopyWithImpl(
      _$SubtaskPartImpl _value, $Res Function(_$SubtaskPartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionID = null,
    Object? messageID = null,
    Object? agent = null,
    Object? description = freezed,
    Object? prompt = freezed,
  }) {
    return _then(_$SubtaskPartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      messageID: null == messageID
          ? _value.messageID
          : messageID // ignore: cast_nullable_to_non_nullable
              as String,
      agent: null == agent
          ? _value.agent
          : agent // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubtaskPartImpl implements SubtaskPart {
  const _$SubtaskPartImpl(
      {required this.id,
      required this.sessionID,
      required this.messageID,
      this.agent = '',
      this.description,
      this.prompt,
      final String? $type})
      : $type = $type ?? 'subtask';

  factory _$SubtaskPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtaskPartImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionID;
  @override
  final String messageID;
  @override
  @JsonKey()
  final String agent;
  @override
  final String? description;
  @override
  final String? prompt;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Part.subtask(id: $id, sessionID: $sessionID, messageID: $messageID, agent: $agent, description: $description, prompt: $prompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtaskPartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.messageID, messageID) ||
                other.messageID == messageID) &&
            (identical(other.agent, agent) || other.agent == agent) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, sessionID, messageID, agent, description, prompt);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtaskPartImplCopyWith<_$SubtaskPartImpl> get copyWith =>
      __$$SubtaskPartImplCopyWithImpl<_$SubtaskPartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        text,
    required TResult Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)
        tool,
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        reasoning,
    required TResult Function(String id, String sessionID, String messageID,
            String url, String mime, String? filename)
        file,
    required TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)
        subtask,
    required TResult Function(String id, String sessionID, String messageID)
        patch,
    required TResult Function(String id, String sessionID, String messageID)
        stepStart,
    required TResult Function(String id, String sessionID, String messageID)
        stepFinish,
  }) {
    return subtask(id, sessionID, messageID, agent, description, prompt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        text,
    TResult? Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)?
        tool,
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        reasoning,
    TResult? Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult? Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult? Function(String id, String sessionID, String messageID)? patch,
    TResult? Function(String id, String sessionID, String messageID)? stepStart,
    TResult? Function(String id, String sessionID, String messageID)?
        stepFinish,
  }) {
    return subtask?.call(id, sessionID, messageID, agent, description, prompt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        text,
    TResult Function(String id, String sessionID, String messageID, String tool,
            ToolState state, PartTime? time)?
        tool,
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        reasoning,
    TResult Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult Function(String id, String sessionID, String messageID)? patch,
    TResult Function(String id, String sessionID, String messageID)? stepStart,
    TResult Function(String id, String sessionID, String messageID)? stepFinish,
    required TResult orElse(),
  }) {
    if (subtask != null) {
      return subtask(id, sessionID, messageID, agent, description, prompt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextPart value) text,
    required TResult Function(ToolPart value) tool,
    required TResult Function(ReasoningPart value) reasoning,
    required TResult Function(FilePart value) file,
    required TResult Function(SubtaskPart value) subtask,
    required TResult Function(PatchPart value) patch,
    required TResult Function(StepStartPart value) stepStart,
    required TResult Function(StepFinishPart value) stepFinish,
  }) {
    return subtask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextPart value)? text,
    TResult? Function(ToolPart value)? tool,
    TResult? Function(ReasoningPart value)? reasoning,
    TResult? Function(FilePart value)? file,
    TResult? Function(SubtaskPart value)? subtask,
    TResult? Function(PatchPart value)? patch,
    TResult? Function(StepStartPart value)? stepStart,
    TResult? Function(StepFinishPart value)? stepFinish,
  }) {
    return subtask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextPart value)? text,
    TResult Function(ToolPart value)? tool,
    TResult Function(ReasoningPart value)? reasoning,
    TResult Function(FilePart value)? file,
    TResult Function(SubtaskPart value)? subtask,
    TResult Function(PatchPart value)? patch,
    TResult Function(StepStartPart value)? stepStart,
    TResult Function(StepFinishPart value)? stepFinish,
    required TResult orElse(),
  }) {
    if (subtask != null) {
      return subtask(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtaskPartImplToJson(
      this,
    );
  }
}

abstract class SubtaskPart implements Part {
  const factory SubtaskPart(
      {required final String id,
      required final String sessionID,
      required final String messageID,
      final String agent,
      final String? description,
      final String? prompt}) = _$SubtaskPartImpl;

  factory SubtaskPart.fromJson(Map<String, dynamic> json) =
      _$SubtaskPartImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionID;
  @override
  String get messageID;
  String get agent;
  String? get description;
  String? get prompt;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtaskPartImplCopyWith<_$SubtaskPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PatchPartImplCopyWith<$Res> implements $PartCopyWith<$Res> {
  factory _$$PatchPartImplCopyWith(
          _$PatchPartImpl value, $Res Function(_$PatchPartImpl) then) =
      __$$PatchPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String sessionID, String messageID});
}

/// @nodoc
class __$$PatchPartImplCopyWithImpl<$Res>
    extends _$PartCopyWithImpl<$Res, _$PatchPartImpl>
    implements _$$PatchPartImplCopyWith<$Res> {
  __$$PatchPartImplCopyWithImpl(
      _$PatchPartImpl _value, $Res Function(_$PatchPartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionID = null,
    Object? messageID = null,
  }) {
    return _then(_$PatchPartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      messageID: null == messageID
          ? _value.messageID
          : messageID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchPartImpl implements PatchPart {
  const _$PatchPartImpl(
      {required this.id,
      required this.sessionID,
      required this.messageID,
      final String? $type})
      : $type = $type ?? 'patch';

  factory _$PatchPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchPartImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionID;
  @override
  final String messageID;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Part.patch(id: $id, sessionID: $sessionID, messageID: $messageID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchPartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.messageID, messageID) ||
                other.messageID == messageID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sessionID, messageID);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchPartImplCopyWith<_$PatchPartImpl> get copyWith =>
      __$$PatchPartImplCopyWithImpl<_$PatchPartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        text,
    required TResult Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)
        tool,
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        reasoning,
    required TResult Function(String id, String sessionID, String messageID,
            String url, String mime, String? filename)
        file,
    required TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)
        subtask,
    required TResult Function(String id, String sessionID, String messageID)
        patch,
    required TResult Function(String id, String sessionID, String messageID)
        stepStart,
    required TResult Function(String id, String sessionID, String messageID)
        stepFinish,
  }) {
    return patch(id, sessionID, messageID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        text,
    TResult? Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)?
        tool,
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        reasoning,
    TResult? Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult? Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult? Function(String id, String sessionID, String messageID)? patch,
    TResult? Function(String id, String sessionID, String messageID)? stepStart,
    TResult? Function(String id, String sessionID, String messageID)?
        stepFinish,
  }) {
    return patch?.call(id, sessionID, messageID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        text,
    TResult Function(String id, String sessionID, String messageID, String tool,
            ToolState state, PartTime? time)?
        tool,
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        reasoning,
    TResult Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult Function(String id, String sessionID, String messageID)? patch,
    TResult Function(String id, String sessionID, String messageID)? stepStart,
    TResult Function(String id, String sessionID, String messageID)? stepFinish,
    required TResult orElse(),
  }) {
    if (patch != null) {
      return patch(id, sessionID, messageID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextPart value) text,
    required TResult Function(ToolPart value) tool,
    required TResult Function(ReasoningPart value) reasoning,
    required TResult Function(FilePart value) file,
    required TResult Function(SubtaskPart value) subtask,
    required TResult Function(PatchPart value) patch,
    required TResult Function(StepStartPart value) stepStart,
    required TResult Function(StepFinishPart value) stepFinish,
  }) {
    return patch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextPart value)? text,
    TResult? Function(ToolPart value)? tool,
    TResult? Function(ReasoningPart value)? reasoning,
    TResult? Function(FilePart value)? file,
    TResult? Function(SubtaskPart value)? subtask,
    TResult? Function(PatchPart value)? patch,
    TResult? Function(StepStartPart value)? stepStart,
    TResult? Function(StepFinishPart value)? stepFinish,
  }) {
    return patch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextPart value)? text,
    TResult Function(ToolPart value)? tool,
    TResult Function(ReasoningPart value)? reasoning,
    TResult Function(FilePart value)? file,
    TResult Function(SubtaskPart value)? subtask,
    TResult Function(PatchPart value)? patch,
    TResult Function(StepStartPart value)? stepStart,
    TResult Function(StepFinishPart value)? stepFinish,
    required TResult orElse(),
  }) {
    if (patch != null) {
      return patch(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchPartImplToJson(
      this,
    );
  }
}

abstract class PatchPart implements Part {
  const factory PatchPart(
      {required final String id,
      required final String sessionID,
      required final String messageID}) = _$PatchPartImpl;

  factory PatchPart.fromJson(Map<String, dynamic> json) =
      _$PatchPartImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionID;
  @override
  String get messageID;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchPartImplCopyWith<_$PatchPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StepStartPartImplCopyWith<$Res>
    implements $PartCopyWith<$Res> {
  factory _$$StepStartPartImplCopyWith(
          _$StepStartPartImpl value, $Res Function(_$StepStartPartImpl) then) =
      __$$StepStartPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String sessionID, String messageID});
}

/// @nodoc
class __$$StepStartPartImplCopyWithImpl<$Res>
    extends _$PartCopyWithImpl<$Res, _$StepStartPartImpl>
    implements _$$StepStartPartImplCopyWith<$Res> {
  __$$StepStartPartImplCopyWithImpl(
      _$StepStartPartImpl _value, $Res Function(_$StepStartPartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionID = null,
    Object? messageID = null,
  }) {
    return _then(_$StepStartPartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      messageID: null == messageID
          ? _value.messageID
          : messageID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StepStartPartImpl implements StepStartPart {
  const _$StepStartPartImpl(
      {required this.id,
      required this.sessionID,
      required this.messageID,
      final String? $type})
      : $type = $type ?? 'step-start';

  factory _$StepStartPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepStartPartImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionID;
  @override
  final String messageID;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Part.stepStart(id: $id, sessionID: $sessionID, messageID: $messageID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepStartPartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.messageID, messageID) ||
                other.messageID == messageID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sessionID, messageID);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepStartPartImplCopyWith<_$StepStartPartImpl> get copyWith =>
      __$$StepStartPartImplCopyWithImpl<_$StepStartPartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        text,
    required TResult Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)
        tool,
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        reasoning,
    required TResult Function(String id, String sessionID, String messageID,
            String url, String mime, String? filename)
        file,
    required TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)
        subtask,
    required TResult Function(String id, String sessionID, String messageID)
        patch,
    required TResult Function(String id, String sessionID, String messageID)
        stepStart,
    required TResult Function(String id, String sessionID, String messageID)
        stepFinish,
  }) {
    return stepStart(id, sessionID, messageID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        text,
    TResult? Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)?
        tool,
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        reasoning,
    TResult? Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult? Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult? Function(String id, String sessionID, String messageID)? patch,
    TResult? Function(String id, String sessionID, String messageID)? stepStart,
    TResult? Function(String id, String sessionID, String messageID)?
        stepFinish,
  }) {
    return stepStart?.call(id, sessionID, messageID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        text,
    TResult Function(String id, String sessionID, String messageID, String tool,
            ToolState state, PartTime? time)?
        tool,
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        reasoning,
    TResult Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult Function(String id, String sessionID, String messageID)? patch,
    TResult Function(String id, String sessionID, String messageID)? stepStart,
    TResult Function(String id, String sessionID, String messageID)? stepFinish,
    required TResult orElse(),
  }) {
    if (stepStart != null) {
      return stepStart(id, sessionID, messageID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextPart value) text,
    required TResult Function(ToolPart value) tool,
    required TResult Function(ReasoningPart value) reasoning,
    required TResult Function(FilePart value) file,
    required TResult Function(SubtaskPart value) subtask,
    required TResult Function(PatchPart value) patch,
    required TResult Function(StepStartPart value) stepStart,
    required TResult Function(StepFinishPart value) stepFinish,
  }) {
    return stepStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextPart value)? text,
    TResult? Function(ToolPart value)? tool,
    TResult? Function(ReasoningPart value)? reasoning,
    TResult? Function(FilePart value)? file,
    TResult? Function(SubtaskPart value)? subtask,
    TResult? Function(PatchPart value)? patch,
    TResult? Function(StepStartPart value)? stepStart,
    TResult? Function(StepFinishPart value)? stepFinish,
  }) {
    return stepStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextPart value)? text,
    TResult Function(ToolPart value)? tool,
    TResult Function(ReasoningPart value)? reasoning,
    TResult Function(FilePart value)? file,
    TResult Function(SubtaskPart value)? subtask,
    TResult Function(PatchPart value)? patch,
    TResult Function(StepStartPart value)? stepStart,
    TResult Function(StepFinishPart value)? stepFinish,
    required TResult orElse(),
  }) {
    if (stepStart != null) {
      return stepStart(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StepStartPartImplToJson(
      this,
    );
  }
}

abstract class StepStartPart implements Part {
  const factory StepStartPart(
      {required final String id,
      required final String sessionID,
      required final String messageID}) = _$StepStartPartImpl;

  factory StepStartPart.fromJson(Map<String, dynamic> json) =
      _$StepStartPartImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionID;
  @override
  String get messageID;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepStartPartImplCopyWith<_$StepStartPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StepFinishPartImplCopyWith<$Res>
    implements $PartCopyWith<$Res> {
  factory _$$StepFinishPartImplCopyWith(_$StepFinishPartImpl value,
          $Res Function(_$StepFinishPartImpl) then) =
      __$$StepFinishPartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String sessionID, String messageID});
}

/// @nodoc
class __$$StepFinishPartImplCopyWithImpl<$Res>
    extends _$PartCopyWithImpl<$Res, _$StepFinishPartImpl>
    implements _$$StepFinishPartImplCopyWith<$Res> {
  __$$StepFinishPartImplCopyWithImpl(
      _$StepFinishPartImpl _value, $Res Function(_$StepFinishPartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionID = null,
    Object? messageID = null,
  }) {
    return _then(_$StepFinishPartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      messageID: null == messageID
          ? _value.messageID
          : messageID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StepFinishPartImpl implements StepFinishPart {
  const _$StepFinishPartImpl(
      {required this.id,
      required this.sessionID,
      required this.messageID,
      final String? $type})
      : $type = $type ?? 'step-finish';

  factory _$StepFinishPartImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepFinishPartImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionID;
  @override
  final String messageID;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Part.stepFinish(id: $id, sessionID: $sessionID, messageID: $messageID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepFinishPartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.messageID, messageID) ||
                other.messageID == messageID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sessionID, messageID);

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepFinishPartImplCopyWith<_$StepFinishPartImpl> get copyWith =>
      __$$StepFinishPartImplCopyWithImpl<_$StepFinishPartImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        text,
    required TResult Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)
        tool,
    required TResult Function(String id, String sessionID, String messageID,
            String text, PartTime? time)
        reasoning,
    required TResult Function(String id, String sessionID, String messageID,
            String url, String mime, String? filename)
        file,
    required TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)
        subtask,
    required TResult Function(String id, String sessionID, String messageID)
        patch,
    required TResult Function(String id, String sessionID, String messageID)
        stepStart,
    required TResult Function(String id, String sessionID, String messageID)
        stepFinish,
  }) {
    return stepFinish(id, sessionID, messageID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        text,
    TResult? Function(String id, String sessionID, String messageID,
            String tool, ToolState state, PartTime? time)?
        tool,
    TResult? Function(String id, String sessionID, String messageID,
            String text, PartTime? time)?
        reasoning,
    TResult? Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult? Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult? Function(String id, String sessionID, String messageID)? patch,
    TResult? Function(String id, String sessionID, String messageID)? stepStart,
    TResult? Function(String id, String sessionID, String messageID)?
        stepFinish,
  }) {
    return stepFinish?.call(id, sessionID, messageID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        text,
    TResult Function(String id, String sessionID, String messageID, String tool,
            ToolState state, PartTime? time)?
        tool,
    TResult Function(String id, String sessionID, String messageID, String text,
            PartTime? time)?
        reasoning,
    TResult Function(String id, String sessionID, String messageID, String url,
            String mime, String? filename)?
        file,
    TResult Function(String id, String sessionID, String messageID,
            String agent, String? description, String? prompt)?
        subtask,
    TResult Function(String id, String sessionID, String messageID)? patch,
    TResult Function(String id, String sessionID, String messageID)? stepStart,
    TResult Function(String id, String sessionID, String messageID)? stepFinish,
    required TResult orElse(),
  }) {
    if (stepFinish != null) {
      return stepFinish(id, sessionID, messageID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextPart value) text,
    required TResult Function(ToolPart value) tool,
    required TResult Function(ReasoningPart value) reasoning,
    required TResult Function(FilePart value) file,
    required TResult Function(SubtaskPart value) subtask,
    required TResult Function(PatchPart value) patch,
    required TResult Function(StepStartPart value) stepStart,
    required TResult Function(StepFinishPart value) stepFinish,
  }) {
    return stepFinish(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextPart value)? text,
    TResult? Function(ToolPart value)? tool,
    TResult? Function(ReasoningPart value)? reasoning,
    TResult? Function(FilePart value)? file,
    TResult? Function(SubtaskPart value)? subtask,
    TResult? Function(PatchPart value)? patch,
    TResult? Function(StepStartPart value)? stepStart,
    TResult? Function(StepFinishPart value)? stepFinish,
  }) {
    return stepFinish?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextPart value)? text,
    TResult Function(ToolPart value)? tool,
    TResult Function(ReasoningPart value)? reasoning,
    TResult Function(FilePart value)? file,
    TResult Function(SubtaskPart value)? subtask,
    TResult Function(PatchPart value)? patch,
    TResult Function(StepStartPart value)? stepStart,
    TResult Function(StepFinishPart value)? stepFinish,
    required TResult orElse(),
  }) {
    if (stepFinish != null) {
      return stepFinish(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StepFinishPartImplToJson(
      this,
    );
  }
}

abstract class StepFinishPart implements Part {
  const factory StepFinishPart(
      {required final String id,
      required final String sessionID,
      required final String messageID}) = _$StepFinishPartImpl;

  factory StepFinishPart.fromJson(Map<String, dynamic> json) =
      _$StepFinishPartImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionID;
  @override
  String get messageID;

  /// Create a copy of Part
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepFinishPartImplCopyWith<_$StepFinishPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
