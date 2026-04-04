import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class QuestionInfo with _$QuestionInfo {
  const factory QuestionInfo({
    required String id,
    String? text,
    @Default([]) List<String> options,
    bool? allowCustom,
  }) = _QuestionInfo;

  factory QuestionInfo.fromJson(Map<String, dynamic> json) =>
      _$QuestionInfoFromJson(json);
}

@freezed
class QuestionRequest with _$QuestionRequest {
  const factory QuestionRequest({
    required String requestId,
    @Default([]) List<QuestionInfo> questions,
  }) = _QuestionRequest;

  factory QuestionRequest.fromJson(Map<String, dynamic> json) =>
      _$QuestionRequestFromJson(json);
}
