// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageTimeImpl _$$MessageTimeImplFromJson(Map<String, dynamic> json) =>
    _$MessageTimeImpl(
      created: (json['created'] as num?)?.toInt(),
      completed: (json['completed'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MessageTimeImplToJson(_$MessageTimeImpl instance) =>
    <String, dynamic>{
      'created': instance.created,
      'completed': instance.completed,
    };

_$MessageInfoImpl _$$MessageInfoImplFromJson(Map<String, dynamic> json) =>
    _$MessageInfoImpl(
      id: json['id'] as String,
      role: json['role'] as String,
      sessionID: json['sessionID'] as String,
      cost: (json['cost'] as num?)?.toDouble() ?? 0.0,
      error: json['error'] as String?,
      time: json['time'] == null
          ? null
          : MessageTime.fromJson(json['time'] as Map<String, dynamic>),
      parentID: json['parentID'] as String?,
    );

Map<String, dynamic> _$$MessageInfoImplToJson(_$MessageInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'sessionID': instance.sessionID,
      'cost': instance.cost,
      'error': instance.error,
      'time': instance.time,
      'parentID': instance.parentID,
    };
