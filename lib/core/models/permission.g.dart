// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionRequestImpl _$$PermissionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionRequestImpl(
      requestId: json['requestId'] as String,
      permission: json['permission'] as String,
      patterns: (json['patterns'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      always: (json['always'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PermissionRequestImplToJson(
        _$PermissionRequestImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'permission': instance.permission,
      'patterns': instance.patterns,
      'metadata': instance.metadata,
      'always': instance.always,
    };
