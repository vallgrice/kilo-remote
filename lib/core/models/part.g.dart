// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartTimeImpl _$$PartTimeImplFromJson(Map<String, dynamic> json) =>
    _$PartTimeImpl(
      start: (json['start'] as num?)?.toInt(),
      end: (json['end'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PartTimeImplToJson(_$PartTimeImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };

_$TextPartImpl _$$TextPartImplFromJson(Map<String, dynamic> json) =>
    _$TextPartImpl(
      id: json['id'] as String,
      sessionID: json['sessionID'] as String,
      messageID: json['messageID'] as String,
      text: json['text'] as String? ?? '',
      time: json['time'] == null
          ? null
          : PartTime.fromJson(json['time'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$TextPartImplToJson(_$TextPartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionID': instance.sessionID,
      'messageID': instance.messageID,
      'text': instance.text,
      'time': instance.time,
      'type': instance.$type,
    };

_$ToolPartImpl _$$ToolPartImplFromJson(Map<String, dynamic> json) =>
    _$ToolPartImpl(
      id: json['id'] as String,
      sessionID: json['sessionID'] as String,
      messageID: json['messageID'] as String,
      tool: json['tool'] as String,
      state: ToolState.fromJson(json['state'] as Map<String, dynamic>),
      time: json['time'] == null
          ? null
          : PartTime.fromJson(json['time'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ToolPartImplToJson(_$ToolPartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionID': instance.sessionID,
      'messageID': instance.messageID,
      'tool': instance.tool,
      'state': instance.state,
      'time': instance.time,
      'type': instance.$type,
    };

_$ReasoningPartImpl _$$ReasoningPartImplFromJson(Map<String, dynamic> json) =>
    _$ReasoningPartImpl(
      id: json['id'] as String,
      sessionID: json['sessionID'] as String,
      messageID: json['messageID'] as String,
      text: json['text'] as String? ?? '',
      time: json['time'] == null
          ? null
          : PartTime.fromJson(json['time'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ReasoningPartImplToJson(_$ReasoningPartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionID': instance.sessionID,
      'messageID': instance.messageID,
      'text': instance.text,
      'time': instance.time,
      'type': instance.$type,
    };

_$FilePartImpl _$$FilePartImplFromJson(Map<String, dynamic> json) =>
    _$FilePartImpl(
      id: json['id'] as String,
      sessionID: json['sessionID'] as String,
      messageID: json['messageID'] as String,
      url: json['url'] as String? ?? '',
      mime: json['mime'] as String? ?? '',
      filename: json['filename'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FilePartImplToJson(_$FilePartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionID': instance.sessionID,
      'messageID': instance.messageID,
      'url': instance.url,
      'mime': instance.mime,
      'filename': instance.filename,
      'type': instance.$type,
    };

_$SubtaskPartImpl _$$SubtaskPartImplFromJson(Map<String, dynamic> json) =>
    _$SubtaskPartImpl(
      id: json['id'] as String,
      sessionID: json['sessionID'] as String,
      messageID: json['messageID'] as String,
      agent: json['agent'] as String? ?? '',
      description: json['description'] as String?,
      prompt: json['prompt'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$SubtaskPartImplToJson(_$SubtaskPartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionID': instance.sessionID,
      'messageID': instance.messageID,
      'agent': instance.agent,
      'description': instance.description,
      'prompt': instance.prompt,
      'type': instance.$type,
    };

_$PatchPartImpl _$$PatchPartImplFromJson(Map<String, dynamic> json) =>
    _$PatchPartImpl(
      id: json['id'] as String,
      sessionID: json['sessionID'] as String,
      messageID: json['messageID'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$PatchPartImplToJson(_$PatchPartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionID': instance.sessionID,
      'messageID': instance.messageID,
      'type': instance.$type,
    };

_$StepStartPartImpl _$$StepStartPartImplFromJson(Map<String, dynamic> json) =>
    _$StepStartPartImpl(
      id: json['id'] as String,
      sessionID: json['sessionID'] as String,
      messageID: json['messageID'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$StepStartPartImplToJson(_$StepStartPartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionID': instance.sessionID,
      'messageID': instance.messageID,
      'type': instance.$type,
    };

_$StepFinishPartImpl _$$StepFinishPartImplFromJson(Map<String, dynamic> json) =>
    _$StepFinishPartImpl(
      id: json['id'] as String,
      sessionID: json['sessionID'] as String,
      messageID: json['messageID'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$StepFinishPartImplToJson(
        _$StepFinishPartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionID': instance.sessionID,
      'messageID': instance.messageID,
      'type': instance.$type,
    };
