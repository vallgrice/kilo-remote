import '../models/events.dart';
import '../models/message.dart';
import '../models/part.dart';
import '../models/session.dart';

class MessageReducer {
  List<StoredMessage> _messages = [];
  final Map<String, int> _messageIndex = {};
  List<StoredMessage>? _cachedMessages;

  /// Returns current messages. The returned list must not be mutated.
  List<StoredMessage> get messages => _cachedMessages ??= List.unmodifiable(_messages);

  void onEvent(ChatEvent event) {
    switch (event) {
      case MessageUpdatedEvent(:final info):
        _upsertMessage(info);
      case PartUpdatedEvent(:final part):
        _upsertPart(part);
      case PartDeltaEvent(:final messageId, :final partId, :final field, :final delta):
        _applyDelta(messageId, partId, field, delta);
      case PartRemovedEvent(:final messageId, :final partId):
        _removePart(messageId, partId);
    }
  }

  void replaySnapshot(SessionInfo info, List<StoredMessage> messages) {
    _messages = [];
    _messageIndex.clear();
    _cachedMessages = null;
    for (final msg in messages) {
      _messageIndex[msg.info.id] = _messages.length;
      _messages.add(msg);
    }
  }

  void clear() {
    _messages = [];
    _messageIndex.clear();
    _cachedMessages = null;
  }

  void _upsertMessage(MessageInfo info) {
    _cachedMessages = null;
    final idx = _messageIndex[info.id];
    if (idx != null) {
      _messages[idx] = _messages[idx].copyWith(info: info);
    } else {
      _messageIndex[info.id] = _messages.length;
      _messages.add(StoredMessage(info: info, parts: []));
    }
  }

  void _upsertPart(Part part) {
    _cachedMessages = null;
    final msgId = part.messageID;
    final idx = _messageIndex[msgId];
    if (idx == null) return;
    final msg = _messages[idx];
    final partIdx = msg.parts.indexWhere((p) => p.id == part.id);
    final newParts = List<Part>.from(msg.parts);
    if (partIdx >= 0) {
      newParts[partIdx] = part;
    } else {
      newParts.add(part);
    }
    _messages[idx] = msg.copyWith(parts: newParts);
  }

  void _applyDelta(String messageId, String partId, String field, String delta) {
    _cachedMessages = null;
    final idx = _messageIndex[messageId];
    if (idx == null) return;
    final msg = _messages[idx];
    final partIdx = msg.parts.indexWhere((p) => p.id == partId);
    if (partIdx < 0) return;
    final part = msg.parts[partIdx];
    final updatedPart = _applyFieldDelta(part, field, delta);
    if (updatedPart == null) return;
    final newParts = List<Part>.from(msg.parts);
    newParts[partIdx] = updatedPart;
    _messages[idx] = msg.copyWith(parts: newParts);
  }

  Part? _applyFieldDelta(Part part, String field, String delta) {
    if (field == 'text') {
      if (part is TextPart) return part.copyWith(text: part.text + delta);
      if (part is ReasoningPart) return part.copyWith(text: part.text + delta);
    }
    return null;
  }

  void _removePart(String messageId, String partId) {
    _cachedMessages = null;
    final idx = _messageIndex[messageId];
    if (idx == null) return;
    final msg = _messages[idx];
    final newParts = msg.parts.where((p) => p.id != partId).toList();
    _messages[idx] = msg.copyWith(parts: newParts);
  }
}
