import '../models/events.dart';
import '../models/message.dart';
import '../models/part.dart';
import '../models/session.dart';

class EventNormalizer {
  EventNormalizer._();

  static dynamic normalize(String eventType, dynamic data) {
    if (data is! Map<String, dynamic>) return null;
    return _normalizeInner(eventType, data);
  }

  static dynamic normalizeSystem(String eventType, dynamic data) {
    switch (eventType) {
      case 'cli.disconnected':
        return const ServiceEvent.stopped(reason: 'disconnected');
      default:
        return null;
    }
  }

  static dynamic _normalizeInner(String eventType, Map<String, dynamic> data) {
    switch (eventType) {
      case 'message.updated':
        final rawInfo = data['info'] as Map<String, dynamic>?;
        if (rawInfo == null) return null;
        return ChatEvent.messageUpdated(info: MessageInfo.fromJson(rawInfo));

      case 'message.part.updated':
        final rawPart = data['part'] as Map<String, dynamic>?;
        if (rawPart == null) return null;
        try {
          return ChatEvent.partUpdated(part: Part.fromJson(rawPart));
        } catch (_) {
          return null; // Skip unknown part types
        }

      case 'message.part.delta':
        final sessionID = data['sessionID'] as String?;
        final messageID = data['messageID'] as String?;
        final partID = data['partID'] as String?;
        final field = data['field'] as String?;
        final delta = data['delta'] as String?;
        if (sessionID == null ||
            messageID == null ||
            partID == null ||
            field == null ||
            delta == null) return null;
        return ChatEvent.partDelta(
          sessionId: sessionID,
          messageId: messageID,
          partId: partID,
          field: field,
          delta: delta,
        );

      case 'message.part.removed':
        final sessionID = data['sessionID'] as String?;
        final messageID = data['messageID'] as String?;
        final partID = data['partID'] as String?;
        if (sessionID == null || messageID == null || partID == null) {
          return null;
        }
        return ChatEvent.partRemoved(
          sessionId: sessionID,
          messageId: messageID,
          partId: partID,
        );

      case 'session.status':
        final sessionID = data['sessionID'] as String?;
        final status = data['status'] as Map<String, dynamic>?;
        if (sessionID == null || status == null) return null;
        return ServiceEvent.sessionStatus(
          sessionId: sessionID,
          status: status,
        );

      case 'session.created':
        final rawInfo = data['info'] as Map<String, dynamic>?;
        if (rawInfo == null) return null;
        return ServiceEvent.sessionCreated(
          info: SessionInfo(
            id: rawInfo['id'] as String? ?? '',
            parentID: rawInfo['parentID']?.toString(),
          ),
        );

      case 'session.error':
        final error = _extractErrorMessage(data['error']);
        final sessionId = data['sessionID'] as String?;
        return ServiceEvent.sessionError(error: error, sessionId: sessionId);

      case 'permission.asked':
        final id = data['id'] as String?;
        final permission = data['permission'] as String?;
        if (id == null || permission == null) return null;
        final patterns = (data['patterns'] as List?)
                ?.map((e) => e.toString())
                .toList() ??
            [];
        final metadata =
            (data['metadata'] as Map<String, dynamic>?) ?? {};
        final always = (data['always'] as List?)
                ?.map((e) => e.toString())
                .toList() ??
            [];
        return ServiceEvent.permissionAsked(
          requestId: id,
          permission: permission,
          patterns: patterns,
          metadata: metadata,
          always: always,
        );

      case 'permission.replied':
        final requestID = data['requestID'] as String?;
        if (requestID == null) return null;
        return ServiceEvent.permissionReplied(requestId: requestID);

      case 'question.asked':
        final id = data['id'] as String?;
        if (id == null) return null;
        final questions = data['questions'] as List?;
        return ServiceEvent.questionAsked(
          requestId: id,
          questions: questions?.cast<Map<String, dynamic>>(),
        );

      case 'question.replied':
        final requestID = data['requestID'] as String?;
        if (requestID == null) return null;
        return ServiceEvent.questionReplied(requestId: requestID);

      case 'complete':
        final branch = data['currentBranch'] as String?;
        return ServiceEvent.stopped(reason: 'complete', branch: branch);

      case 'interrupted':
        return const ServiceEvent.stopped(reason: 'interrupted');

      default:
        return null;
    }
  }

  static String _extractErrorMessage(dynamic rawError) {
    if (rawError is String) return rawError;
    if (rawError is Map) {
      if (rawError['data'] is Map &&
          rawError['data']['message'] is String) {
        return rawError['data']['message'] as String;
      }
      if (rawError['message'] is String) {
        return rawError['message'] as String;
      }
    }
    return 'Unknown error';
  }
}
