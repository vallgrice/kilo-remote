import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';
import 'part.dart';
import 'session.dart';

part 'events.freezed.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.messageUpdated({required MessageInfo info}) =
      MessageUpdatedEvent;
  const factory ChatEvent.partUpdated({required Part part}) = PartUpdatedEvent;
  const factory ChatEvent.partDelta({
    required String sessionId,
    required String messageId,
    required String partId,
    required String field,
    required String delta,
  }) = PartDeltaEvent;
  const factory ChatEvent.partRemoved({
    required String sessionId,
    required String messageId,
    required String partId,
  }) = PartRemovedEvent;
}

@freezed
class ServiceEvent with _$ServiceEvent {
  const factory ServiceEvent.sessionCreated({required SessionInfo info}) =
      SessionCreatedEvent;
  const factory ServiceEvent.sessionStatus({
    required String sessionId,
    required Map<String, dynamic> status,
  }) = SessionStatusEvent;
  const factory ServiceEvent.permissionAsked({
    required String requestId,
    required String permission,
    required List<String> patterns,
    required Map<String, dynamic> metadata,
    required List<String> always,
  }) = PermissionAskedEvent;
  const factory ServiceEvent.permissionReplied({required String requestId}) =
      PermissionRepliedEvent;
  const factory ServiceEvent.questionAsked({
    required String requestId,
    List<Map<String, dynamic>>? questions,
  }) = QuestionAskedEvent;
  const factory ServiceEvent.questionReplied({required String requestId}) =
      QuestionRepliedEvent;
  const factory ServiceEvent.stopped({
    required String reason,
    String? branch,
  }) = StoppedEvent;
  const factory ServiceEvent.sessionError({
    required String error,
    String? sessionId,
  }) = SessionErrorEvent;
}
