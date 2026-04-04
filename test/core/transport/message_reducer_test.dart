import 'package:flutter_test/flutter_test.dart';
import 'package:kilo_remote_flutter/core/models/events.dart';
import 'package:kilo_remote_flutter/core/models/message.dart';
import 'package:kilo_remote_flutter/core/models/part.dart';
import 'package:kilo_remote_flutter/core/transport/message_reducer.dart';

void main() {
  group('MessageReducer', () {
    late MessageReducer reducer;

    setUp(() {
      reducer = MessageReducer();
    });

    test('adds new message on messageUpdated', () {
      final info = MessageInfo(id: 'msg1', role: 'assistant', sessionID: 's1');
      reducer.onEvent(ChatEvent.messageUpdated(info: info));
      expect(reducer.messages, hasLength(1));
      expect(reducer.messages.first.info.id, 'msg1');
    });

    test('updates existing message info', () {
      final info1 = MessageInfo(id: 'msg1', role: 'assistant', sessionID: 's1');
      final info2 = MessageInfo(id: 'msg1', role: 'assistant', sessionID: 's1', cost: 0.5);
      reducer.onEvent(ChatEvent.messageUpdated(info: info1));
      reducer.onEvent(ChatEvent.messageUpdated(info: info2));
      expect(reducer.messages, hasLength(1));
      expect(reducer.messages.first.info.cost, 0.5);
    });

    test('adds part to message on partUpdated', () {
      final info = MessageInfo(id: 'msg1', role: 'assistant', sessionID: 's1');
      reducer.onEvent(ChatEvent.messageUpdated(info: info));
      final part = Part.text(id: 'p1', sessionID: 's1', messageID: 'msg1', text: 'hi');
      reducer.onEvent(ChatEvent.partUpdated(part: part));
      expect(reducer.messages.first.parts, hasLength(1));
    });

    test('appends text on partDelta', () {
      final info = MessageInfo(id: 'msg1', role: 'assistant', sessionID: 's1');
      reducer.onEvent(ChatEvent.messageUpdated(info: info));
      final part = Part.text(id: 'p1', sessionID: 's1', messageID: 'msg1', text: 'hel');
      reducer.onEvent(ChatEvent.partUpdated(part: part));
      reducer.onEvent(ChatEvent.partDelta(sessionId: 's1', messageId: 'msg1', partId: 'p1', field: 'text', delta: 'lo'));
      final textPart = reducer.messages.first.parts.first as TextPart;
      expect(textPart.text, 'hello');
    });

    test('removes part on partRemoved', () {
      final info = MessageInfo(id: 'msg1', role: 'assistant', sessionID: 's1');
      reducer.onEvent(ChatEvent.messageUpdated(info: info));
      final part = Part.text(id: 'p1', sessionID: 's1', messageID: 'msg1');
      reducer.onEvent(ChatEvent.partUpdated(part: part));
      reducer.onEvent(ChatEvent.partRemoved(sessionId: 's1', messageId: 'msg1', partId: 'p1'));
      expect(reducer.messages.first.parts, isEmpty);
    });
  });
}
