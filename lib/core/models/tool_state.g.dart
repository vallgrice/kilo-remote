// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToolStateImpl _$$ToolStateImplFromJson(Map<String, dynamic> json) =>
    _$ToolStateImpl(
      status: $enumDecode(_$ToolStatusEnumMap, json['status']),
      input: json['input'] as Map<String, dynamic>? ?? const {},
      output: json['output'],
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$ToolStateImplToJson(_$ToolStateImpl instance) =>
    <String, dynamic>{
      'status': _$ToolStatusEnumMap[instance.status]!,
      'input': instance.input,
      'output': instance.output,
      'error': instance.error,
    };

const _$ToolStatusEnumMap = {
  ToolStatus.pending: 'pending',
  ToolStatus.running: 'running',
  ToolStatus.completed: 'completed',
  ToolStatus.error: 'error',
};
