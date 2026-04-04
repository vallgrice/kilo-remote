// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiveSessionImpl _$$ActiveSessionImplFromJson(Map<String, dynamic> json) =>
    _$ActiveSessionImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      title: json['title'] as String,
      connectionId: json['connectionId'] as String,
      gitUrl: json['gitUrl'] as String?,
      gitBranch: json['gitBranch'] as String?,
    );

Map<String, dynamic> _$$ActiveSessionImplToJson(_$ActiveSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'title': instance.title,
      'connectionId': instance.connectionId,
      'gitUrl': instance.gitUrl,
      'gitBranch': instance.gitBranch,
    };

_$SessionInfoImpl _$$SessionInfoImplFromJson(Map<String, dynamic> json) =>
    _$SessionInfoImpl(
      id: json['id'] as String,
      parentID: json['parentID'] as String?,
    );

Map<String, dynamic> _$$SessionInfoImplToJson(_$SessionInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentID': instance.parentID,
    };
