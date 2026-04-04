// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MessageInfo info) messageUpdated,
    required TResult Function(Part part) partUpdated,
    required TResult Function(String sessionId, String messageId, String partId,
            String field, String delta)
        partDelta,
    required TResult Function(String sessionId, String messageId, String partId)
        partRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MessageInfo info)? messageUpdated,
    TResult? Function(Part part)? partUpdated,
    TResult? Function(String sessionId, String messageId, String partId,
            String field, String delta)?
        partDelta,
    TResult? Function(String sessionId, String messageId, String partId)?
        partRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MessageInfo info)? messageUpdated,
    TResult Function(Part part)? partUpdated,
    TResult Function(String sessionId, String messageId, String partId,
            String field, String delta)?
        partDelta,
    TResult Function(String sessionId, String messageId, String partId)?
        partRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageUpdatedEvent value) messageUpdated,
    required TResult Function(PartUpdatedEvent value) partUpdated,
    required TResult Function(PartDeltaEvent value) partDelta,
    required TResult Function(PartRemovedEvent value) partRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageUpdatedEvent value)? messageUpdated,
    TResult? Function(PartUpdatedEvent value)? partUpdated,
    TResult? Function(PartDeltaEvent value)? partDelta,
    TResult? Function(PartRemovedEvent value)? partRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageUpdatedEvent value)? messageUpdated,
    TResult Function(PartUpdatedEvent value)? partUpdated,
    TResult Function(PartDeltaEvent value)? partDelta,
    TResult Function(PartRemovedEvent value)? partRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MessageUpdatedEventImplCopyWith<$Res> {
  factory _$$MessageUpdatedEventImplCopyWith(_$MessageUpdatedEventImpl value,
          $Res Function(_$MessageUpdatedEventImpl) then) =
      __$$MessageUpdatedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MessageInfo info});

  $MessageInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$MessageUpdatedEventImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$MessageUpdatedEventImpl>
    implements _$$MessageUpdatedEventImplCopyWith<$Res> {
  __$$MessageUpdatedEventImplCopyWithImpl(_$MessageUpdatedEventImpl _value,
      $Res Function(_$MessageUpdatedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$MessageUpdatedEventImpl(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as MessageInfo,
    ));
  }

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageInfoCopyWith<$Res> get info {
    return $MessageInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value));
    });
  }
}

/// @nodoc

class _$MessageUpdatedEventImpl implements MessageUpdatedEvent {
  const _$MessageUpdatedEventImpl({required this.info});

  @override
  final MessageInfo info;

  @override
  String toString() {
    return 'ChatEvent.messageUpdated(info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageUpdatedEventImpl &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageUpdatedEventImplCopyWith<_$MessageUpdatedEventImpl> get copyWith =>
      __$$MessageUpdatedEventImplCopyWithImpl<_$MessageUpdatedEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MessageInfo info) messageUpdated,
    required TResult Function(Part part) partUpdated,
    required TResult Function(String sessionId, String messageId, String partId,
            String field, String delta)
        partDelta,
    required TResult Function(String sessionId, String messageId, String partId)
        partRemoved,
  }) {
    return messageUpdated(info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MessageInfo info)? messageUpdated,
    TResult? Function(Part part)? partUpdated,
    TResult? Function(String sessionId, String messageId, String partId,
            String field, String delta)?
        partDelta,
    TResult? Function(String sessionId, String messageId, String partId)?
        partRemoved,
  }) {
    return messageUpdated?.call(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MessageInfo info)? messageUpdated,
    TResult Function(Part part)? partUpdated,
    TResult Function(String sessionId, String messageId, String partId,
            String field, String delta)?
        partDelta,
    TResult Function(String sessionId, String messageId, String partId)?
        partRemoved,
    required TResult orElse(),
  }) {
    if (messageUpdated != null) {
      return messageUpdated(info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageUpdatedEvent value) messageUpdated,
    required TResult Function(PartUpdatedEvent value) partUpdated,
    required TResult Function(PartDeltaEvent value) partDelta,
    required TResult Function(PartRemovedEvent value) partRemoved,
  }) {
    return messageUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageUpdatedEvent value)? messageUpdated,
    TResult? Function(PartUpdatedEvent value)? partUpdated,
    TResult? Function(PartDeltaEvent value)? partDelta,
    TResult? Function(PartRemovedEvent value)? partRemoved,
  }) {
    return messageUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageUpdatedEvent value)? messageUpdated,
    TResult Function(PartUpdatedEvent value)? partUpdated,
    TResult Function(PartDeltaEvent value)? partDelta,
    TResult Function(PartRemovedEvent value)? partRemoved,
    required TResult orElse(),
  }) {
    if (messageUpdated != null) {
      return messageUpdated(this);
    }
    return orElse();
  }
}

abstract class MessageUpdatedEvent implements ChatEvent {
  const factory MessageUpdatedEvent({required final MessageInfo info}) =
      _$MessageUpdatedEventImpl;

  MessageInfo get info;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageUpdatedEventImplCopyWith<_$MessageUpdatedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PartUpdatedEventImplCopyWith<$Res> {
  factory _$$PartUpdatedEventImplCopyWith(_$PartUpdatedEventImpl value,
          $Res Function(_$PartUpdatedEventImpl) then) =
      __$$PartUpdatedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Part part});

  $PartCopyWith<$Res> get part;
}

/// @nodoc
class __$$PartUpdatedEventImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$PartUpdatedEventImpl>
    implements _$$PartUpdatedEventImplCopyWith<$Res> {
  __$$PartUpdatedEventImplCopyWithImpl(_$PartUpdatedEventImpl _value,
      $Res Function(_$PartUpdatedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? part = null,
  }) {
    return _then(_$PartUpdatedEventImpl(
      part: null == part
          ? _value.part
          : part // ignore: cast_nullable_to_non_nullable
              as Part,
    ));
  }

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartCopyWith<$Res> get part {
    return $PartCopyWith<$Res>(_value.part, (value) {
      return _then(_value.copyWith(part: value));
    });
  }
}

/// @nodoc

class _$PartUpdatedEventImpl implements PartUpdatedEvent {
  const _$PartUpdatedEventImpl({required this.part});

  @override
  final Part part;

  @override
  String toString() {
    return 'ChatEvent.partUpdated(part: $part)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartUpdatedEventImpl &&
            (identical(other.part, part) || other.part == part));
  }

  @override
  int get hashCode => Object.hash(runtimeType, part);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartUpdatedEventImplCopyWith<_$PartUpdatedEventImpl> get copyWith =>
      __$$PartUpdatedEventImplCopyWithImpl<_$PartUpdatedEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MessageInfo info) messageUpdated,
    required TResult Function(Part part) partUpdated,
    required TResult Function(String sessionId, String messageId, String partId,
            String field, String delta)
        partDelta,
    required TResult Function(String sessionId, String messageId, String partId)
        partRemoved,
  }) {
    return partUpdated(part);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MessageInfo info)? messageUpdated,
    TResult? Function(Part part)? partUpdated,
    TResult? Function(String sessionId, String messageId, String partId,
            String field, String delta)?
        partDelta,
    TResult? Function(String sessionId, String messageId, String partId)?
        partRemoved,
  }) {
    return partUpdated?.call(part);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MessageInfo info)? messageUpdated,
    TResult Function(Part part)? partUpdated,
    TResult Function(String sessionId, String messageId, String partId,
            String field, String delta)?
        partDelta,
    TResult Function(String sessionId, String messageId, String partId)?
        partRemoved,
    required TResult orElse(),
  }) {
    if (partUpdated != null) {
      return partUpdated(part);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageUpdatedEvent value) messageUpdated,
    required TResult Function(PartUpdatedEvent value) partUpdated,
    required TResult Function(PartDeltaEvent value) partDelta,
    required TResult Function(PartRemovedEvent value) partRemoved,
  }) {
    return partUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageUpdatedEvent value)? messageUpdated,
    TResult? Function(PartUpdatedEvent value)? partUpdated,
    TResult? Function(PartDeltaEvent value)? partDelta,
    TResult? Function(PartRemovedEvent value)? partRemoved,
  }) {
    return partUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageUpdatedEvent value)? messageUpdated,
    TResult Function(PartUpdatedEvent value)? partUpdated,
    TResult Function(PartDeltaEvent value)? partDelta,
    TResult Function(PartRemovedEvent value)? partRemoved,
    required TResult orElse(),
  }) {
    if (partUpdated != null) {
      return partUpdated(this);
    }
    return orElse();
  }
}

abstract class PartUpdatedEvent implements ChatEvent {
  const factory PartUpdatedEvent({required final Part part}) =
      _$PartUpdatedEventImpl;

  Part get part;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartUpdatedEventImplCopyWith<_$PartUpdatedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PartDeltaEventImplCopyWith<$Res> {
  factory _$$PartDeltaEventImplCopyWith(_$PartDeltaEventImpl value,
          $Res Function(_$PartDeltaEventImpl) then) =
      __$$PartDeltaEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String sessionId,
      String messageId,
      String partId,
      String field,
      String delta});
}

/// @nodoc
class __$$PartDeltaEventImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$PartDeltaEventImpl>
    implements _$$PartDeltaEventImplCopyWith<$Res> {
  __$$PartDeltaEventImplCopyWithImpl(
      _$PartDeltaEventImpl _value, $Res Function(_$PartDeltaEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? messageId = null,
    Object? partId = null,
    Object? field = null,
    Object? delta = null,
  }) {
    return _then(_$PartDeltaEventImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as String,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PartDeltaEventImpl implements PartDeltaEvent {
  const _$PartDeltaEventImpl(
      {required this.sessionId,
      required this.messageId,
      required this.partId,
      required this.field,
      required this.delta});

  @override
  final String sessionId;
  @override
  final String messageId;
  @override
  final String partId;
  @override
  final String field;
  @override
  final String delta;

  @override
  String toString() {
    return 'ChatEvent.partDelta(sessionId: $sessionId, messageId: $messageId, partId: $partId, field: $field, delta: $delta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartDeltaEventImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.partId, partId) || other.partId == partId) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sessionId, messageId, partId, field, delta);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartDeltaEventImplCopyWith<_$PartDeltaEventImpl> get copyWith =>
      __$$PartDeltaEventImplCopyWithImpl<_$PartDeltaEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MessageInfo info) messageUpdated,
    required TResult Function(Part part) partUpdated,
    required TResult Function(String sessionId, String messageId, String partId,
            String field, String delta)
        partDelta,
    required TResult Function(String sessionId, String messageId, String partId)
        partRemoved,
  }) {
    return partDelta(sessionId, messageId, partId, field, delta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MessageInfo info)? messageUpdated,
    TResult? Function(Part part)? partUpdated,
    TResult? Function(String sessionId, String messageId, String partId,
            String field, String delta)?
        partDelta,
    TResult? Function(String sessionId, String messageId, String partId)?
        partRemoved,
  }) {
    return partDelta?.call(sessionId, messageId, partId, field, delta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MessageInfo info)? messageUpdated,
    TResult Function(Part part)? partUpdated,
    TResult Function(String sessionId, String messageId, String partId,
            String field, String delta)?
        partDelta,
    TResult Function(String sessionId, String messageId, String partId)?
        partRemoved,
    required TResult orElse(),
  }) {
    if (partDelta != null) {
      return partDelta(sessionId, messageId, partId, field, delta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageUpdatedEvent value) messageUpdated,
    required TResult Function(PartUpdatedEvent value) partUpdated,
    required TResult Function(PartDeltaEvent value) partDelta,
    required TResult Function(PartRemovedEvent value) partRemoved,
  }) {
    return partDelta(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageUpdatedEvent value)? messageUpdated,
    TResult? Function(PartUpdatedEvent value)? partUpdated,
    TResult? Function(PartDeltaEvent value)? partDelta,
    TResult? Function(PartRemovedEvent value)? partRemoved,
  }) {
    return partDelta?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageUpdatedEvent value)? messageUpdated,
    TResult Function(PartUpdatedEvent value)? partUpdated,
    TResult Function(PartDeltaEvent value)? partDelta,
    TResult Function(PartRemovedEvent value)? partRemoved,
    required TResult orElse(),
  }) {
    if (partDelta != null) {
      return partDelta(this);
    }
    return orElse();
  }
}

abstract class PartDeltaEvent implements ChatEvent {
  const factory PartDeltaEvent(
      {required final String sessionId,
      required final String messageId,
      required final String partId,
      required final String field,
      required final String delta}) = _$PartDeltaEventImpl;

  String get sessionId;
  String get messageId;
  String get partId;
  String get field;
  String get delta;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartDeltaEventImplCopyWith<_$PartDeltaEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PartRemovedEventImplCopyWith<$Res> {
  factory _$$PartRemovedEventImplCopyWith(_$PartRemovedEventImpl value,
          $Res Function(_$PartRemovedEventImpl) then) =
      __$$PartRemovedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sessionId, String messageId, String partId});
}

/// @nodoc
class __$$PartRemovedEventImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$PartRemovedEventImpl>
    implements _$$PartRemovedEventImplCopyWith<$Res> {
  __$$PartRemovedEventImplCopyWithImpl(_$PartRemovedEventImpl _value,
      $Res Function(_$PartRemovedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? messageId = null,
    Object? partId = null,
  }) {
    return _then(_$PartRemovedEventImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      partId: null == partId
          ? _value.partId
          : partId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PartRemovedEventImpl implements PartRemovedEvent {
  const _$PartRemovedEventImpl(
      {required this.sessionId, required this.messageId, required this.partId});

  @override
  final String sessionId;
  @override
  final String messageId;
  @override
  final String partId;

  @override
  String toString() {
    return 'ChatEvent.partRemoved(sessionId: $sessionId, messageId: $messageId, partId: $partId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartRemovedEventImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.partId, partId) || other.partId == partId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId, messageId, partId);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartRemovedEventImplCopyWith<_$PartRemovedEventImpl> get copyWith =>
      __$$PartRemovedEventImplCopyWithImpl<_$PartRemovedEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MessageInfo info) messageUpdated,
    required TResult Function(Part part) partUpdated,
    required TResult Function(String sessionId, String messageId, String partId,
            String field, String delta)
        partDelta,
    required TResult Function(String sessionId, String messageId, String partId)
        partRemoved,
  }) {
    return partRemoved(sessionId, messageId, partId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MessageInfo info)? messageUpdated,
    TResult? Function(Part part)? partUpdated,
    TResult? Function(String sessionId, String messageId, String partId,
            String field, String delta)?
        partDelta,
    TResult? Function(String sessionId, String messageId, String partId)?
        partRemoved,
  }) {
    return partRemoved?.call(sessionId, messageId, partId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MessageInfo info)? messageUpdated,
    TResult Function(Part part)? partUpdated,
    TResult Function(String sessionId, String messageId, String partId,
            String field, String delta)?
        partDelta,
    TResult Function(String sessionId, String messageId, String partId)?
        partRemoved,
    required TResult orElse(),
  }) {
    if (partRemoved != null) {
      return partRemoved(sessionId, messageId, partId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageUpdatedEvent value) messageUpdated,
    required TResult Function(PartUpdatedEvent value) partUpdated,
    required TResult Function(PartDeltaEvent value) partDelta,
    required TResult Function(PartRemovedEvent value) partRemoved,
  }) {
    return partRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageUpdatedEvent value)? messageUpdated,
    TResult? Function(PartUpdatedEvent value)? partUpdated,
    TResult? Function(PartDeltaEvent value)? partDelta,
    TResult? Function(PartRemovedEvent value)? partRemoved,
  }) {
    return partRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageUpdatedEvent value)? messageUpdated,
    TResult Function(PartUpdatedEvent value)? partUpdated,
    TResult Function(PartDeltaEvent value)? partDelta,
    TResult Function(PartRemovedEvent value)? partRemoved,
    required TResult orElse(),
  }) {
    if (partRemoved != null) {
      return partRemoved(this);
    }
    return orElse();
  }
}

abstract class PartRemovedEvent implements ChatEvent {
  const factory PartRemovedEvent(
      {required final String sessionId,
      required final String messageId,
      required final String partId}) = _$PartRemovedEventImpl;

  String get sessionId;
  String get messageId;
  String get partId;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartRemovedEventImplCopyWith<_$PartRemovedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ServiceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionInfo info) sessionCreated,
    required TResult Function(String sessionId, Map<String, dynamic> status)
        sessionStatus,
    required TResult Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)
        permissionAsked,
    required TResult Function(String requestId) permissionReplied,
    required TResult Function(
            String requestId, List<Map<String, dynamic>>? questions)
        questionAsked,
    required TResult Function(String requestId) questionReplied,
    required TResult Function(String reason, String? branch) stopped,
    required TResult Function(String error, String? sessionId) sessionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionInfo info)? sessionCreated,
    TResult? Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult? Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)?
        permissionAsked,
    TResult? Function(String requestId)? permissionReplied,
    TResult? Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult? Function(String requestId)? questionReplied,
    TResult? Function(String reason, String? branch)? stopped,
    TResult? Function(String error, String? sessionId)? sessionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionInfo info)? sessionCreated,
    TResult Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult Function(String requestId, String permission, List<String> patterns,
            Map<String, dynamic> metadata, List<String> always)?
        permissionAsked,
    TResult Function(String requestId)? permissionReplied,
    TResult Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult Function(String requestId)? questionReplied,
    TResult Function(String reason, String? branch)? stopped,
    TResult Function(String error, String? sessionId)? sessionError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionCreatedEvent value) sessionCreated,
    required TResult Function(SessionStatusEvent value) sessionStatus,
    required TResult Function(PermissionAskedEvent value) permissionAsked,
    required TResult Function(PermissionRepliedEvent value) permissionReplied,
    required TResult Function(QuestionAskedEvent value) questionAsked,
    required TResult Function(QuestionRepliedEvent value) questionReplied,
    required TResult Function(StoppedEvent value) stopped,
    required TResult Function(SessionErrorEvent value) sessionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionCreatedEvent value)? sessionCreated,
    TResult? Function(SessionStatusEvent value)? sessionStatus,
    TResult? Function(PermissionAskedEvent value)? permissionAsked,
    TResult? Function(PermissionRepliedEvent value)? permissionReplied,
    TResult? Function(QuestionAskedEvent value)? questionAsked,
    TResult? Function(QuestionRepliedEvent value)? questionReplied,
    TResult? Function(StoppedEvent value)? stopped,
    TResult? Function(SessionErrorEvent value)? sessionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionCreatedEvent value)? sessionCreated,
    TResult Function(SessionStatusEvent value)? sessionStatus,
    TResult Function(PermissionAskedEvent value)? permissionAsked,
    TResult Function(PermissionRepliedEvent value)? permissionReplied,
    TResult Function(QuestionAskedEvent value)? questionAsked,
    TResult Function(QuestionRepliedEvent value)? questionReplied,
    TResult Function(StoppedEvent value)? stopped,
    TResult Function(SessionErrorEvent value)? sessionError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceEventCopyWith<$Res> {
  factory $ServiceEventCopyWith(
          ServiceEvent value, $Res Function(ServiceEvent) then) =
      _$ServiceEventCopyWithImpl<$Res, ServiceEvent>;
}

/// @nodoc
class _$ServiceEventCopyWithImpl<$Res, $Val extends ServiceEvent>
    implements $ServiceEventCopyWith<$Res> {
  _$ServiceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SessionCreatedEventImplCopyWith<$Res> {
  factory _$$SessionCreatedEventImplCopyWith(_$SessionCreatedEventImpl value,
          $Res Function(_$SessionCreatedEventImpl) then) =
      __$$SessionCreatedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SessionInfo info});

  $SessionInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$SessionCreatedEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$SessionCreatedEventImpl>
    implements _$$SessionCreatedEventImplCopyWith<$Res> {
  __$$SessionCreatedEventImplCopyWithImpl(_$SessionCreatedEventImpl _value,
      $Res Function(_$SessionCreatedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$SessionCreatedEventImpl(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as SessionInfo,
    ));
  }

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionInfoCopyWith<$Res> get info {
    return $SessionInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value));
    });
  }
}

/// @nodoc

class _$SessionCreatedEventImpl implements SessionCreatedEvent {
  const _$SessionCreatedEventImpl({required this.info});

  @override
  final SessionInfo info;

  @override
  String toString() {
    return 'ServiceEvent.sessionCreated(info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionCreatedEventImpl &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionCreatedEventImplCopyWith<_$SessionCreatedEventImpl> get copyWith =>
      __$$SessionCreatedEventImplCopyWithImpl<_$SessionCreatedEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionInfo info) sessionCreated,
    required TResult Function(String sessionId, Map<String, dynamic> status)
        sessionStatus,
    required TResult Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)
        permissionAsked,
    required TResult Function(String requestId) permissionReplied,
    required TResult Function(
            String requestId, List<Map<String, dynamic>>? questions)
        questionAsked,
    required TResult Function(String requestId) questionReplied,
    required TResult Function(String reason, String? branch) stopped,
    required TResult Function(String error, String? sessionId) sessionError,
  }) {
    return sessionCreated(info);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionInfo info)? sessionCreated,
    TResult? Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult? Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)?
        permissionAsked,
    TResult? Function(String requestId)? permissionReplied,
    TResult? Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult? Function(String requestId)? questionReplied,
    TResult? Function(String reason, String? branch)? stopped,
    TResult? Function(String error, String? sessionId)? sessionError,
  }) {
    return sessionCreated?.call(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionInfo info)? sessionCreated,
    TResult Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult Function(String requestId, String permission, List<String> patterns,
            Map<String, dynamic> metadata, List<String> always)?
        permissionAsked,
    TResult Function(String requestId)? permissionReplied,
    TResult Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult Function(String requestId)? questionReplied,
    TResult Function(String reason, String? branch)? stopped,
    TResult Function(String error, String? sessionId)? sessionError,
    required TResult orElse(),
  }) {
    if (sessionCreated != null) {
      return sessionCreated(info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionCreatedEvent value) sessionCreated,
    required TResult Function(SessionStatusEvent value) sessionStatus,
    required TResult Function(PermissionAskedEvent value) permissionAsked,
    required TResult Function(PermissionRepliedEvent value) permissionReplied,
    required TResult Function(QuestionAskedEvent value) questionAsked,
    required TResult Function(QuestionRepliedEvent value) questionReplied,
    required TResult Function(StoppedEvent value) stopped,
    required TResult Function(SessionErrorEvent value) sessionError,
  }) {
    return sessionCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionCreatedEvent value)? sessionCreated,
    TResult? Function(SessionStatusEvent value)? sessionStatus,
    TResult? Function(PermissionAskedEvent value)? permissionAsked,
    TResult? Function(PermissionRepliedEvent value)? permissionReplied,
    TResult? Function(QuestionAskedEvent value)? questionAsked,
    TResult? Function(QuestionRepliedEvent value)? questionReplied,
    TResult? Function(StoppedEvent value)? stopped,
    TResult? Function(SessionErrorEvent value)? sessionError,
  }) {
    return sessionCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionCreatedEvent value)? sessionCreated,
    TResult Function(SessionStatusEvent value)? sessionStatus,
    TResult Function(PermissionAskedEvent value)? permissionAsked,
    TResult Function(PermissionRepliedEvent value)? permissionReplied,
    TResult Function(QuestionAskedEvent value)? questionAsked,
    TResult Function(QuestionRepliedEvent value)? questionReplied,
    TResult Function(StoppedEvent value)? stopped,
    TResult Function(SessionErrorEvent value)? sessionError,
    required TResult orElse(),
  }) {
    if (sessionCreated != null) {
      return sessionCreated(this);
    }
    return orElse();
  }
}

abstract class SessionCreatedEvent implements ServiceEvent {
  const factory SessionCreatedEvent({required final SessionInfo info}) =
      _$SessionCreatedEventImpl;

  SessionInfo get info;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionCreatedEventImplCopyWith<_$SessionCreatedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionStatusEventImplCopyWith<$Res> {
  factory _$$SessionStatusEventImplCopyWith(_$SessionStatusEventImpl value,
          $Res Function(_$SessionStatusEventImpl) then) =
      __$$SessionStatusEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String sessionId, Map<String, dynamic> status});
}

/// @nodoc
class __$$SessionStatusEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$SessionStatusEventImpl>
    implements _$$SessionStatusEventImplCopyWith<$Res> {
  __$$SessionStatusEventImplCopyWithImpl(_$SessionStatusEventImpl _value,
      $Res Function(_$SessionStatusEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? status = null,
  }) {
    return _then(_$SessionStatusEventImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$SessionStatusEventImpl implements SessionStatusEvent {
  const _$SessionStatusEventImpl(
      {required this.sessionId, required final Map<String, dynamic> status})
      : _status = status;

  @override
  final String sessionId;
  final Map<String, dynamic> _status;
  @override
  Map<String, dynamic> get status {
    if (_status is EqualUnmodifiableMapView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_status);
  }

  @override
  String toString() {
    return 'ServiceEvent.sessionStatus(sessionId: $sessionId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionStatusEventImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            const DeepCollectionEquality().equals(other._status, _status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, sessionId, const DeepCollectionEquality().hash(_status));

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionStatusEventImplCopyWith<_$SessionStatusEventImpl> get copyWith =>
      __$$SessionStatusEventImplCopyWithImpl<_$SessionStatusEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionInfo info) sessionCreated,
    required TResult Function(String sessionId, Map<String, dynamic> status)
        sessionStatus,
    required TResult Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)
        permissionAsked,
    required TResult Function(String requestId) permissionReplied,
    required TResult Function(
            String requestId, List<Map<String, dynamic>>? questions)
        questionAsked,
    required TResult Function(String requestId) questionReplied,
    required TResult Function(String reason, String? branch) stopped,
    required TResult Function(String error, String? sessionId) sessionError,
  }) {
    return sessionStatus(sessionId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionInfo info)? sessionCreated,
    TResult? Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult? Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)?
        permissionAsked,
    TResult? Function(String requestId)? permissionReplied,
    TResult? Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult? Function(String requestId)? questionReplied,
    TResult? Function(String reason, String? branch)? stopped,
    TResult? Function(String error, String? sessionId)? sessionError,
  }) {
    return sessionStatus?.call(sessionId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionInfo info)? sessionCreated,
    TResult Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult Function(String requestId, String permission, List<String> patterns,
            Map<String, dynamic> metadata, List<String> always)?
        permissionAsked,
    TResult Function(String requestId)? permissionReplied,
    TResult Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult Function(String requestId)? questionReplied,
    TResult Function(String reason, String? branch)? stopped,
    TResult Function(String error, String? sessionId)? sessionError,
    required TResult orElse(),
  }) {
    if (sessionStatus != null) {
      return sessionStatus(sessionId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionCreatedEvent value) sessionCreated,
    required TResult Function(SessionStatusEvent value) sessionStatus,
    required TResult Function(PermissionAskedEvent value) permissionAsked,
    required TResult Function(PermissionRepliedEvent value) permissionReplied,
    required TResult Function(QuestionAskedEvent value) questionAsked,
    required TResult Function(QuestionRepliedEvent value) questionReplied,
    required TResult Function(StoppedEvent value) stopped,
    required TResult Function(SessionErrorEvent value) sessionError,
  }) {
    return sessionStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionCreatedEvent value)? sessionCreated,
    TResult? Function(SessionStatusEvent value)? sessionStatus,
    TResult? Function(PermissionAskedEvent value)? permissionAsked,
    TResult? Function(PermissionRepliedEvent value)? permissionReplied,
    TResult? Function(QuestionAskedEvent value)? questionAsked,
    TResult? Function(QuestionRepliedEvent value)? questionReplied,
    TResult? Function(StoppedEvent value)? stopped,
    TResult? Function(SessionErrorEvent value)? sessionError,
  }) {
    return sessionStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionCreatedEvent value)? sessionCreated,
    TResult Function(SessionStatusEvent value)? sessionStatus,
    TResult Function(PermissionAskedEvent value)? permissionAsked,
    TResult Function(PermissionRepliedEvent value)? permissionReplied,
    TResult Function(QuestionAskedEvent value)? questionAsked,
    TResult Function(QuestionRepliedEvent value)? questionReplied,
    TResult Function(StoppedEvent value)? stopped,
    TResult Function(SessionErrorEvent value)? sessionError,
    required TResult orElse(),
  }) {
    if (sessionStatus != null) {
      return sessionStatus(this);
    }
    return orElse();
  }
}

abstract class SessionStatusEvent implements ServiceEvent {
  const factory SessionStatusEvent(
      {required final String sessionId,
      required final Map<String, dynamic> status}) = _$SessionStatusEventImpl;

  String get sessionId;
  Map<String, dynamic> get status;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionStatusEventImplCopyWith<_$SessionStatusEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionAskedEventImplCopyWith<$Res> {
  factory _$$PermissionAskedEventImplCopyWith(_$PermissionAskedEventImpl value,
          $Res Function(_$PermissionAskedEventImpl) then) =
      __$$PermissionAskedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String requestId,
      String permission,
      List<String> patterns,
      Map<String, dynamic> metadata,
      List<String> always});
}

/// @nodoc
class __$$PermissionAskedEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$PermissionAskedEventImpl>
    implements _$$PermissionAskedEventImplCopyWith<$Res> {
  __$$PermissionAskedEventImplCopyWithImpl(_$PermissionAskedEventImpl _value,
      $Res Function(_$PermissionAskedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceEvent
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
    return _then(_$PermissionAskedEventImpl(
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

class _$PermissionAskedEventImpl implements PermissionAskedEvent {
  const _$PermissionAskedEventImpl(
      {required this.requestId,
      required this.permission,
      required final List<String> patterns,
      required final Map<String, dynamic> metadata,
      required final List<String> always})
      : _patterns = patterns,
        _metadata = metadata,
        _always = always;

  @override
  final String requestId;
  @override
  final String permission;
  final List<String> _patterns;
  @override
  List<String> get patterns {
    if (_patterns is EqualUnmodifiableListView) return _patterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patterns);
  }

  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  final List<String> _always;
  @override
  List<String> get always {
    if (_always is EqualUnmodifiableListView) return _always;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_always);
  }

  @override
  String toString() {
    return 'ServiceEvent.permissionAsked(requestId: $requestId, permission: $permission, patterns: $patterns, metadata: $metadata, always: $always)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionAskedEventImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            const DeepCollectionEquality().equals(other._patterns, _patterns) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality().equals(other._always, _always));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestId,
      permission,
      const DeepCollectionEquality().hash(_patterns),
      const DeepCollectionEquality().hash(_metadata),
      const DeepCollectionEquality().hash(_always));

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionAskedEventImplCopyWith<_$PermissionAskedEventImpl>
      get copyWith =>
          __$$PermissionAskedEventImplCopyWithImpl<_$PermissionAskedEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionInfo info) sessionCreated,
    required TResult Function(String sessionId, Map<String, dynamic> status)
        sessionStatus,
    required TResult Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)
        permissionAsked,
    required TResult Function(String requestId) permissionReplied,
    required TResult Function(
            String requestId, List<Map<String, dynamic>>? questions)
        questionAsked,
    required TResult Function(String requestId) questionReplied,
    required TResult Function(String reason, String? branch) stopped,
    required TResult Function(String error, String? sessionId) sessionError,
  }) {
    return permissionAsked(requestId, permission, patterns, metadata, always);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionInfo info)? sessionCreated,
    TResult? Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult? Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)?
        permissionAsked,
    TResult? Function(String requestId)? permissionReplied,
    TResult? Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult? Function(String requestId)? questionReplied,
    TResult? Function(String reason, String? branch)? stopped,
    TResult? Function(String error, String? sessionId)? sessionError,
  }) {
    return permissionAsked?.call(
        requestId, permission, patterns, metadata, always);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionInfo info)? sessionCreated,
    TResult Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult Function(String requestId, String permission, List<String> patterns,
            Map<String, dynamic> metadata, List<String> always)?
        permissionAsked,
    TResult Function(String requestId)? permissionReplied,
    TResult Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult Function(String requestId)? questionReplied,
    TResult Function(String reason, String? branch)? stopped,
    TResult Function(String error, String? sessionId)? sessionError,
    required TResult orElse(),
  }) {
    if (permissionAsked != null) {
      return permissionAsked(requestId, permission, patterns, metadata, always);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionCreatedEvent value) sessionCreated,
    required TResult Function(SessionStatusEvent value) sessionStatus,
    required TResult Function(PermissionAskedEvent value) permissionAsked,
    required TResult Function(PermissionRepliedEvent value) permissionReplied,
    required TResult Function(QuestionAskedEvent value) questionAsked,
    required TResult Function(QuestionRepliedEvent value) questionReplied,
    required TResult Function(StoppedEvent value) stopped,
    required TResult Function(SessionErrorEvent value) sessionError,
  }) {
    return permissionAsked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionCreatedEvent value)? sessionCreated,
    TResult? Function(SessionStatusEvent value)? sessionStatus,
    TResult? Function(PermissionAskedEvent value)? permissionAsked,
    TResult? Function(PermissionRepliedEvent value)? permissionReplied,
    TResult? Function(QuestionAskedEvent value)? questionAsked,
    TResult? Function(QuestionRepliedEvent value)? questionReplied,
    TResult? Function(StoppedEvent value)? stopped,
    TResult? Function(SessionErrorEvent value)? sessionError,
  }) {
    return permissionAsked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionCreatedEvent value)? sessionCreated,
    TResult Function(SessionStatusEvent value)? sessionStatus,
    TResult Function(PermissionAskedEvent value)? permissionAsked,
    TResult Function(PermissionRepliedEvent value)? permissionReplied,
    TResult Function(QuestionAskedEvent value)? questionAsked,
    TResult Function(QuestionRepliedEvent value)? questionReplied,
    TResult Function(StoppedEvent value)? stopped,
    TResult Function(SessionErrorEvent value)? sessionError,
    required TResult orElse(),
  }) {
    if (permissionAsked != null) {
      return permissionAsked(this);
    }
    return orElse();
  }
}

abstract class PermissionAskedEvent implements ServiceEvent {
  const factory PermissionAskedEvent(
      {required final String requestId,
      required final String permission,
      required final List<String> patterns,
      required final Map<String, dynamic> metadata,
      required final List<String> always}) = _$PermissionAskedEventImpl;

  String get requestId;
  String get permission;
  List<String> get patterns;
  Map<String, dynamic> get metadata;
  List<String> get always;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionAskedEventImplCopyWith<_$PermissionAskedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionRepliedEventImplCopyWith<$Res> {
  factory _$$PermissionRepliedEventImplCopyWith(
          _$PermissionRepliedEventImpl value,
          $Res Function(_$PermissionRepliedEventImpl) then) =
      __$$PermissionRepliedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String requestId});
}

/// @nodoc
class __$$PermissionRepliedEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$PermissionRepliedEventImpl>
    implements _$$PermissionRepliedEventImplCopyWith<$Res> {
  __$$PermissionRepliedEventImplCopyWithImpl(
      _$PermissionRepliedEventImpl _value,
      $Res Function(_$PermissionRepliedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$PermissionRepliedEventImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PermissionRepliedEventImpl implements PermissionRepliedEvent {
  const _$PermissionRepliedEventImpl({required this.requestId});

  @override
  final String requestId;

  @override
  String toString() {
    return 'ServiceEvent.permissionReplied(requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionRepliedEventImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionRepliedEventImplCopyWith<_$PermissionRepliedEventImpl>
      get copyWith => __$$PermissionRepliedEventImplCopyWithImpl<
          _$PermissionRepliedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionInfo info) sessionCreated,
    required TResult Function(String sessionId, Map<String, dynamic> status)
        sessionStatus,
    required TResult Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)
        permissionAsked,
    required TResult Function(String requestId) permissionReplied,
    required TResult Function(
            String requestId, List<Map<String, dynamic>>? questions)
        questionAsked,
    required TResult Function(String requestId) questionReplied,
    required TResult Function(String reason, String? branch) stopped,
    required TResult Function(String error, String? sessionId) sessionError,
  }) {
    return permissionReplied(requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionInfo info)? sessionCreated,
    TResult? Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult? Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)?
        permissionAsked,
    TResult? Function(String requestId)? permissionReplied,
    TResult? Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult? Function(String requestId)? questionReplied,
    TResult? Function(String reason, String? branch)? stopped,
    TResult? Function(String error, String? sessionId)? sessionError,
  }) {
    return permissionReplied?.call(requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionInfo info)? sessionCreated,
    TResult Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult Function(String requestId, String permission, List<String> patterns,
            Map<String, dynamic> metadata, List<String> always)?
        permissionAsked,
    TResult Function(String requestId)? permissionReplied,
    TResult Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult Function(String requestId)? questionReplied,
    TResult Function(String reason, String? branch)? stopped,
    TResult Function(String error, String? sessionId)? sessionError,
    required TResult orElse(),
  }) {
    if (permissionReplied != null) {
      return permissionReplied(requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionCreatedEvent value) sessionCreated,
    required TResult Function(SessionStatusEvent value) sessionStatus,
    required TResult Function(PermissionAskedEvent value) permissionAsked,
    required TResult Function(PermissionRepliedEvent value) permissionReplied,
    required TResult Function(QuestionAskedEvent value) questionAsked,
    required TResult Function(QuestionRepliedEvent value) questionReplied,
    required TResult Function(StoppedEvent value) stopped,
    required TResult Function(SessionErrorEvent value) sessionError,
  }) {
    return permissionReplied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionCreatedEvent value)? sessionCreated,
    TResult? Function(SessionStatusEvent value)? sessionStatus,
    TResult? Function(PermissionAskedEvent value)? permissionAsked,
    TResult? Function(PermissionRepliedEvent value)? permissionReplied,
    TResult? Function(QuestionAskedEvent value)? questionAsked,
    TResult? Function(QuestionRepliedEvent value)? questionReplied,
    TResult? Function(StoppedEvent value)? stopped,
    TResult? Function(SessionErrorEvent value)? sessionError,
  }) {
    return permissionReplied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionCreatedEvent value)? sessionCreated,
    TResult Function(SessionStatusEvent value)? sessionStatus,
    TResult Function(PermissionAskedEvent value)? permissionAsked,
    TResult Function(PermissionRepliedEvent value)? permissionReplied,
    TResult Function(QuestionAskedEvent value)? questionAsked,
    TResult Function(QuestionRepliedEvent value)? questionReplied,
    TResult Function(StoppedEvent value)? stopped,
    TResult Function(SessionErrorEvent value)? sessionError,
    required TResult orElse(),
  }) {
    if (permissionReplied != null) {
      return permissionReplied(this);
    }
    return orElse();
  }
}

abstract class PermissionRepliedEvent implements ServiceEvent {
  const factory PermissionRepliedEvent({required final String requestId}) =
      _$PermissionRepliedEventImpl;

  String get requestId;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionRepliedEventImplCopyWith<_$PermissionRepliedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuestionAskedEventImplCopyWith<$Res> {
  factory _$$QuestionAskedEventImplCopyWith(_$QuestionAskedEventImpl value,
          $Res Function(_$QuestionAskedEventImpl) then) =
      __$$QuestionAskedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String requestId, List<Map<String, dynamic>>? questions});
}

/// @nodoc
class __$$QuestionAskedEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$QuestionAskedEventImpl>
    implements _$$QuestionAskedEventImplCopyWith<$Res> {
  __$$QuestionAskedEventImplCopyWithImpl(_$QuestionAskedEventImpl _value,
      $Res Function(_$QuestionAskedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? questions = freezed,
  }) {
    return _then(_$QuestionAskedEventImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc

class _$QuestionAskedEventImpl implements QuestionAskedEvent {
  const _$QuestionAskedEventImpl(
      {required this.requestId, final List<Map<String, dynamic>>? questions})
      : _questions = questions;

  @override
  final String requestId;
  final List<Map<String, dynamic>>? _questions;
  @override
  List<Map<String, dynamic>>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ServiceEvent.questionAsked(requestId: $requestId, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionAskedEventImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, requestId, const DeepCollectionEquality().hash(_questions));

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionAskedEventImplCopyWith<_$QuestionAskedEventImpl> get copyWith =>
      __$$QuestionAskedEventImplCopyWithImpl<_$QuestionAskedEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionInfo info) sessionCreated,
    required TResult Function(String sessionId, Map<String, dynamic> status)
        sessionStatus,
    required TResult Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)
        permissionAsked,
    required TResult Function(String requestId) permissionReplied,
    required TResult Function(
            String requestId, List<Map<String, dynamic>>? questions)
        questionAsked,
    required TResult Function(String requestId) questionReplied,
    required TResult Function(String reason, String? branch) stopped,
    required TResult Function(String error, String? sessionId) sessionError,
  }) {
    return questionAsked(requestId, questions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionInfo info)? sessionCreated,
    TResult? Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult? Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)?
        permissionAsked,
    TResult? Function(String requestId)? permissionReplied,
    TResult? Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult? Function(String requestId)? questionReplied,
    TResult? Function(String reason, String? branch)? stopped,
    TResult? Function(String error, String? sessionId)? sessionError,
  }) {
    return questionAsked?.call(requestId, questions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionInfo info)? sessionCreated,
    TResult Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult Function(String requestId, String permission, List<String> patterns,
            Map<String, dynamic> metadata, List<String> always)?
        permissionAsked,
    TResult Function(String requestId)? permissionReplied,
    TResult Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult Function(String requestId)? questionReplied,
    TResult Function(String reason, String? branch)? stopped,
    TResult Function(String error, String? sessionId)? sessionError,
    required TResult orElse(),
  }) {
    if (questionAsked != null) {
      return questionAsked(requestId, questions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionCreatedEvent value) sessionCreated,
    required TResult Function(SessionStatusEvent value) sessionStatus,
    required TResult Function(PermissionAskedEvent value) permissionAsked,
    required TResult Function(PermissionRepliedEvent value) permissionReplied,
    required TResult Function(QuestionAskedEvent value) questionAsked,
    required TResult Function(QuestionRepliedEvent value) questionReplied,
    required TResult Function(StoppedEvent value) stopped,
    required TResult Function(SessionErrorEvent value) sessionError,
  }) {
    return questionAsked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionCreatedEvent value)? sessionCreated,
    TResult? Function(SessionStatusEvent value)? sessionStatus,
    TResult? Function(PermissionAskedEvent value)? permissionAsked,
    TResult? Function(PermissionRepliedEvent value)? permissionReplied,
    TResult? Function(QuestionAskedEvent value)? questionAsked,
    TResult? Function(QuestionRepliedEvent value)? questionReplied,
    TResult? Function(StoppedEvent value)? stopped,
    TResult? Function(SessionErrorEvent value)? sessionError,
  }) {
    return questionAsked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionCreatedEvent value)? sessionCreated,
    TResult Function(SessionStatusEvent value)? sessionStatus,
    TResult Function(PermissionAskedEvent value)? permissionAsked,
    TResult Function(PermissionRepliedEvent value)? permissionReplied,
    TResult Function(QuestionAskedEvent value)? questionAsked,
    TResult Function(QuestionRepliedEvent value)? questionReplied,
    TResult Function(StoppedEvent value)? stopped,
    TResult Function(SessionErrorEvent value)? sessionError,
    required TResult orElse(),
  }) {
    if (questionAsked != null) {
      return questionAsked(this);
    }
    return orElse();
  }
}

abstract class QuestionAskedEvent implements ServiceEvent {
  const factory QuestionAskedEvent(
      {required final String requestId,
      final List<Map<String, dynamic>>? questions}) = _$QuestionAskedEventImpl;

  String get requestId;
  List<Map<String, dynamic>>? get questions;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionAskedEventImplCopyWith<_$QuestionAskedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuestionRepliedEventImplCopyWith<$Res> {
  factory _$$QuestionRepliedEventImplCopyWith(_$QuestionRepliedEventImpl value,
          $Res Function(_$QuestionRepliedEventImpl) then) =
      __$$QuestionRepliedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String requestId});
}

/// @nodoc
class __$$QuestionRepliedEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$QuestionRepliedEventImpl>
    implements _$$QuestionRepliedEventImplCopyWith<$Res> {
  __$$QuestionRepliedEventImplCopyWithImpl(_$QuestionRepliedEventImpl _value,
      $Res Function(_$QuestionRepliedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$QuestionRepliedEventImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QuestionRepliedEventImpl implements QuestionRepliedEvent {
  const _$QuestionRepliedEventImpl({required this.requestId});

  @override
  final String requestId;

  @override
  String toString() {
    return 'ServiceEvent.questionReplied(requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionRepliedEventImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionRepliedEventImplCopyWith<_$QuestionRepliedEventImpl>
      get copyWith =>
          __$$QuestionRepliedEventImplCopyWithImpl<_$QuestionRepliedEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionInfo info) sessionCreated,
    required TResult Function(String sessionId, Map<String, dynamic> status)
        sessionStatus,
    required TResult Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)
        permissionAsked,
    required TResult Function(String requestId) permissionReplied,
    required TResult Function(
            String requestId, List<Map<String, dynamic>>? questions)
        questionAsked,
    required TResult Function(String requestId) questionReplied,
    required TResult Function(String reason, String? branch) stopped,
    required TResult Function(String error, String? sessionId) sessionError,
  }) {
    return questionReplied(requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionInfo info)? sessionCreated,
    TResult? Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult? Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)?
        permissionAsked,
    TResult? Function(String requestId)? permissionReplied,
    TResult? Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult? Function(String requestId)? questionReplied,
    TResult? Function(String reason, String? branch)? stopped,
    TResult? Function(String error, String? sessionId)? sessionError,
  }) {
    return questionReplied?.call(requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionInfo info)? sessionCreated,
    TResult Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult Function(String requestId, String permission, List<String> patterns,
            Map<String, dynamic> metadata, List<String> always)?
        permissionAsked,
    TResult Function(String requestId)? permissionReplied,
    TResult Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult Function(String requestId)? questionReplied,
    TResult Function(String reason, String? branch)? stopped,
    TResult Function(String error, String? sessionId)? sessionError,
    required TResult orElse(),
  }) {
    if (questionReplied != null) {
      return questionReplied(requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionCreatedEvent value) sessionCreated,
    required TResult Function(SessionStatusEvent value) sessionStatus,
    required TResult Function(PermissionAskedEvent value) permissionAsked,
    required TResult Function(PermissionRepliedEvent value) permissionReplied,
    required TResult Function(QuestionAskedEvent value) questionAsked,
    required TResult Function(QuestionRepliedEvent value) questionReplied,
    required TResult Function(StoppedEvent value) stopped,
    required TResult Function(SessionErrorEvent value) sessionError,
  }) {
    return questionReplied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionCreatedEvent value)? sessionCreated,
    TResult? Function(SessionStatusEvent value)? sessionStatus,
    TResult? Function(PermissionAskedEvent value)? permissionAsked,
    TResult? Function(PermissionRepliedEvent value)? permissionReplied,
    TResult? Function(QuestionAskedEvent value)? questionAsked,
    TResult? Function(QuestionRepliedEvent value)? questionReplied,
    TResult? Function(StoppedEvent value)? stopped,
    TResult? Function(SessionErrorEvent value)? sessionError,
  }) {
    return questionReplied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionCreatedEvent value)? sessionCreated,
    TResult Function(SessionStatusEvent value)? sessionStatus,
    TResult Function(PermissionAskedEvent value)? permissionAsked,
    TResult Function(PermissionRepliedEvent value)? permissionReplied,
    TResult Function(QuestionAskedEvent value)? questionAsked,
    TResult Function(QuestionRepliedEvent value)? questionReplied,
    TResult Function(StoppedEvent value)? stopped,
    TResult Function(SessionErrorEvent value)? sessionError,
    required TResult orElse(),
  }) {
    if (questionReplied != null) {
      return questionReplied(this);
    }
    return orElse();
  }
}

abstract class QuestionRepliedEvent implements ServiceEvent {
  const factory QuestionRepliedEvent({required final String requestId}) =
      _$QuestionRepliedEventImpl;

  String get requestId;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionRepliedEventImplCopyWith<_$QuestionRepliedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoppedEventImplCopyWith<$Res> {
  factory _$$StoppedEventImplCopyWith(
          _$StoppedEventImpl value, $Res Function(_$StoppedEventImpl) then) =
      __$$StoppedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reason, String? branch});
}

/// @nodoc
class __$$StoppedEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$StoppedEventImpl>
    implements _$$StoppedEventImplCopyWith<$Res> {
  __$$StoppedEventImplCopyWithImpl(
      _$StoppedEventImpl _value, $Res Function(_$StoppedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? branch = freezed,
  }) {
    return _then(_$StoppedEventImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StoppedEventImpl implements StoppedEvent {
  const _$StoppedEventImpl({required this.reason, this.branch});

  @override
  final String reason;
  @override
  final String? branch;

  @override
  String toString() {
    return 'ServiceEvent.stopped(reason: $reason, branch: $branch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoppedEventImpl &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason, branch);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoppedEventImplCopyWith<_$StoppedEventImpl> get copyWith =>
      __$$StoppedEventImplCopyWithImpl<_$StoppedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionInfo info) sessionCreated,
    required TResult Function(String sessionId, Map<String, dynamic> status)
        sessionStatus,
    required TResult Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)
        permissionAsked,
    required TResult Function(String requestId) permissionReplied,
    required TResult Function(
            String requestId, List<Map<String, dynamic>>? questions)
        questionAsked,
    required TResult Function(String requestId) questionReplied,
    required TResult Function(String reason, String? branch) stopped,
    required TResult Function(String error, String? sessionId) sessionError,
  }) {
    return stopped(reason, branch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionInfo info)? sessionCreated,
    TResult? Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult? Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)?
        permissionAsked,
    TResult? Function(String requestId)? permissionReplied,
    TResult? Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult? Function(String requestId)? questionReplied,
    TResult? Function(String reason, String? branch)? stopped,
    TResult? Function(String error, String? sessionId)? sessionError,
  }) {
    return stopped?.call(reason, branch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionInfo info)? sessionCreated,
    TResult Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult Function(String requestId, String permission, List<String> patterns,
            Map<String, dynamic> metadata, List<String> always)?
        permissionAsked,
    TResult Function(String requestId)? permissionReplied,
    TResult Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult Function(String requestId)? questionReplied,
    TResult Function(String reason, String? branch)? stopped,
    TResult Function(String error, String? sessionId)? sessionError,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(reason, branch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionCreatedEvent value) sessionCreated,
    required TResult Function(SessionStatusEvent value) sessionStatus,
    required TResult Function(PermissionAskedEvent value) permissionAsked,
    required TResult Function(PermissionRepliedEvent value) permissionReplied,
    required TResult Function(QuestionAskedEvent value) questionAsked,
    required TResult Function(QuestionRepliedEvent value) questionReplied,
    required TResult Function(StoppedEvent value) stopped,
    required TResult Function(SessionErrorEvent value) sessionError,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionCreatedEvent value)? sessionCreated,
    TResult? Function(SessionStatusEvent value)? sessionStatus,
    TResult? Function(PermissionAskedEvent value)? permissionAsked,
    TResult? Function(PermissionRepliedEvent value)? permissionReplied,
    TResult? Function(QuestionAskedEvent value)? questionAsked,
    TResult? Function(QuestionRepliedEvent value)? questionReplied,
    TResult? Function(StoppedEvent value)? stopped,
    TResult? Function(SessionErrorEvent value)? sessionError,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionCreatedEvent value)? sessionCreated,
    TResult Function(SessionStatusEvent value)? sessionStatus,
    TResult Function(PermissionAskedEvent value)? permissionAsked,
    TResult Function(PermissionRepliedEvent value)? permissionReplied,
    TResult Function(QuestionAskedEvent value)? questionAsked,
    TResult Function(QuestionRepliedEvent value)? questionReplied,
    TResult Function(StoppedEvent value)? stopped,
    TResult Function(SessionErrorEvent value)? sessionError,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }
}

abstract class StoppedEvent implements ServiceEvent {
  const factory StoppedEvent(
      {required final String reason,
      final String? branch}) = _$StoppedEventImpl;

  String get reason;
  String? get branch;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoppedEventImplCopyWith<_$StoppedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionErrorEventImplCopyWith<$Res> {
  factory _$$SessionErrorEventImplCopyWith(_$SessionErrorEventImpl value,
          $Res Function(_$SessionErrorEventImpl) then) =
      __$$SessionErrorEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error, String? sessionId});
}

/// @nodoc
class __$$SessionErrorEventImplCopyWithImpl<$Res>
    extends _$ServiceEventCopyWithImpl<$Res, _$SessionErrorEventImpl>
    implements _$$SessionErrorEventImplCopyWith<$Res> {
  __$$SessionErrorEventImplCopyWithImpl(_$SessionErrorEventImpl _value,
      $Res Function(_$SessionErrorEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? sessionId = freezed,
  }) {
    return _then(_$SessionErrorEventImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SessionErrorEventImpl implements SessionErrorEvent {
  const _$SessionErrorEventImpl({required this.error, this.sessionId});

  @override
  final String error;
  @override
  final String? sessionId;

  @override
  String toString() {
    return 'ServiceEvent.sessionError(error: $error, sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionErrorEventImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, sessionId);

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionErrorEventImplCopyWith<_$SessionErrorEventImpl> get copyWith =>
      __$$SessionErrorEventImplCopyWithImpl<_$SessionErrorEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionInfo info) sessionCreated,
    required TResult Function(String sessionId, Map<String, dynamic> status)
        sessionStatus,
    required TResult Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)
        permissionAsked,
    required TResult Function(String requestId) permissionReplied,
    required TResult Function(
            String requestId, List<Map<String, dynamic>>? questions)
        questionAsked,
    required TResult Function(String requestId) questionReplied,
    required TResult Function(String reason, String? branch) stopped,
    required TResult Function(String error, String? sessionId) sessionError,
  }) {
    return sessionError(error, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionInfo info)? sessionCreated,
    TResult? Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult? Function(
            String requestId,
            String permission,
            List<String> patterns,
            Map<String, dynamic> metadata,
            List<String> always)?
        permissionAsked,
    TResult? Function(String requestId)? permissionReplied,
    TResult? Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult? Function(String requestId)? questionReplied,
    TResult? Function(String reason, String? branch)? stopped,
    TResult? Function(String error, String? sessionId)? sessionError,
  }) {
    return sessionError?.call(error, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionInfo info)? sessionCreated,
    TResult Function(String sessionId, Map<String, dynamic> status)?
        sessionStatus,
    TResult Function(String requestId, String permission, List<String> patterns,
            Map<String, dynamic> metadata, List<String> always)?
        permissionAsked,
    TResult Function(String requestId)? permissionReplied,
    TResult Function(String requestId, List<Map<String, dynamic>>? questions)?
        questionAsked,
    TResult Function(String requestId)? questionReplied,
    TResult Function(String reason, String? branch)? stopped,
    TResult Function(String error, String? sessionId)? sessionError,
    required TResult orElse(),
  }) {
    if (sessionError != null) {
      return sessionError(error, sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SessionCreatedEvent value) sessionCreated,
    required TResult Function(SessionStatusEvent value) sessionStatus,
    required TResult Function(PermissionAskedEvent value) permissionAsked,
    required TResult Function(PermissionRepliedEvent value) permissionReplied,
    required TResult Function(QuestionAskedEvent value) questionAsked,
    required TResult Function(QuestionRepliedEvent value) questionReplied,
    required TResult Function(StoppedEvent value) stopped,
    required TResult Function(SessionErrorEvent value) sessionError,
  }) {
    return sessionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SessionCreatedEvent value)? sessionCreated,
    TResult? Function(SessionStatusEvent value)? sessionStatus,
    TResult? Function(PermissionAskedEvent value)? permissionAsked,
    TResult? Function(PermissionRepliedEvent value)? permissionReplied,
    TResult? Function(QuestionAskedEvent value)? questionAsked,
    TResult? Function(QuestionRepliedEvent value)? questionReplied,
    TResult? Function(StoppedEvent value)? stopped,
    TResult? Function(SessionErrorEvent value)? sessionError,
  }) {
    return sessionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SessionCreatedEvent value)? sessionCreated,
    TResult Function(SessionStatusEvent value)? sessionStatus,
    TResult Function(PermissionAskedEvent value)? permissionAsked,
    TResult Function(PermissionRepliedEvent value)? permissionReplied,
    TResult Function(QuestionAskedEvent value)? questionAsked,
    TResult Function(QuestionRepliedEvent value)? questionReplied,
    TResult Function(StoppedEvent value)? stopped,
    TResult Function(SessionErrorEvent value)? sessionError,
    required TResult orElse(),
  }) {
    if (sessionError != null) {
      return sessionError(this);
    }
    return orElse();
  }
}

abstract class SessionErrorEvent implements ServiceEvent {
  const factory SessionErrorEvent(
      {required final String error,
      final String? sessionId}) = _$SessionErrorEventImpl;

  String get error;
  String? get sessionId;

  /// Create a copy of ServiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionErrorEventImplCopyWith<_$SessionErrorEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
