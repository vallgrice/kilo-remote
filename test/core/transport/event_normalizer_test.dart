import 'package:flutter_test/flutter_test.dart';
import 'package:kilo_remote_flutter/core/transport/event_normalizer.dart';
import 'package:kilo_remote_flutter/core/models/events.dart';

void main() {
  group('EventNormalizer', () {
    test('normalizes message.updated event', () {
      final result = EventNormalizer.normalize('message.updated', {
        'info': {'id': 'msg1', 'sessionID': 'ses1', 'role': 'assistant'},
      });
      expect(result, isA<MessageUpdatedEvent>());
      final event = result as MessageUpdatedEvent;
      expect(event.info.id, 'msg1');
    });

    test('normalizes message.part.delta event', () {
      final result = EventNormalizer.normalize('message.part.delta', {
        'sessionID': 'ses1',
        'messageID': 'msg1',
        'partID': 'part1',
        'field': 'text',
        'delta': 'hello ',
      });
      expect(result, isA<PartDeltaEvent>());
      final event = result as PartDeltaEvent;
      expect(event.delta, 'hello ');
    });

    test('normalizes permission.asked event', () {
      final result = EventNormalizer.normalize('permission.asked', {
        'id': 'perm1',
        'permission': 'Bash',
        'patterns': ['npm install'],
        'metadata': {'command': 'npm install'},
        'always': [],
      });
      expect(result, isA<PermissionAskedEvent>());
      final event = result as PermissionAskedEvent;
      expect(event.permission, 'Bash');
    });

    test('normalizes question.asked event', () {
      final result = EventNormalizer.normalize('question.asked', {
        'id': 'q1',
        'questions': [
          {
            'id': 'q1_1',
            'text': 'Continue?',
            'options': ['yes', 'no'],
          },
        ],
      });
      expect(result, isA<QuestionAskedEvent>());
    });

    test('normalizes cli.disconnected as stopped', () {
      final result = EventNormalizer.normalizeSystem(
        'cli.disconnected',
        {'connectionId': 'conn1'},
      );
      expect(result, isA<StoppedEvent>());
      expect((result as StoppedEvent).reason, 'disconnected');
    });

    test('returns null for unknown event types', () {
      expect(EventNormalizer.normalize('unknown.event', {}), isNull);
    });
  });
}
