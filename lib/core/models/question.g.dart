// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionInfoImpl _$$QuestionInfoImplFromJson(Map<String, dynamic> json) =>
    _$QuestionInfoImpl(
      id: json['id'] as String,
      text: json['text'] as String?,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      allowCustom: json['allowCustom'] as bool?,
    );

Map<String, dynamic> _$$QuestionInfoImplToJson(_$QuestionInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'options': instance.options,
      'allowCustom': instance.allowCustom,
    };

_$QuestionRequestImpl _$$QuestionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionRequestImpl(
      requestId: json['requestId'] as String,
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => QuestionInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$QuestionRequestImplToJson(
        _$QuestionRequestImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'questions': instance.questions,
    };
