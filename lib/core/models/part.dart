import 'package:freezed_annotation/freezed_annotation.dart';
import 'tool_state.dart';

part 'part.freezed.dart';
part 'part.g.dart';

@freezed
class PartTime with _$PartTime {
  const factory PartTime({
    int? start,
    int? end,
  }) = _PartTime;

  factory PartTime.fromJson(Map<String, dynamic> json) =>
      _$PartTimeFromJson(json);
}

@Freezed(unionKey: 'type')
class Part with _$Part {
  @FreezedUnionValue('text')
  const factory Part.text({
    required String id,
    required String sessionID,
    required String messageID,
    @Default('') String text,
    PartTime? time,
  }) = TextPart;

  @FreezedUnionValue('tool')
  const factory Part.tool({
    required String id,
    required String sessionID,
    required String messageID,
    required String tool,
    required ToolState state,
    PartTime? time,
  }) = ToolPart;

  @FreezedUnionValue('reasoning')
  const factory Part.reasoning({
    required String id,
    required String sessionID,
    required String messageID,
    @Default('') String text,
    PartTime? time,
  }) = ReasoningPart;

  @FreezedUnionValue('file')
  const factory Part.file({
    required String id,
    required String sessionID,
    required String messageID,
    @Default('') String url,
    @Default('') String mime,
    String? filename,
  }) = FilePart;

  @FreezedUnionValue('subtask')
  const factory Part.subtask({
    required String id,
    required String sessionID,
    required String messageID,
    @Default('') String agent,
    String? description,
    String? prompt,
  }) = SubtaskPart;

  @FreezedUnionValue('patch')
  const factory Part.patch({
    required String id,
    required String sessionID,
    required String messageID,
  }) = PatchPart;

  @FreezedUnionValue('step-start')
  const factory Part.stepStart({
    required String id,
    required String sessionID,
    required String messageID,
  }) = StepStartPart;

  @FreezedUnionValue('step-finish')
  const factory Part.stepFinish({
    required String id,
    required String sessionID,
    required String messageID,
  }) = StepFinishPart;

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);
}
