import 'package:freezed_annotation/freezed_annotation.dart';
import 'part.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class MessageTime with _$MessageTime {
  const factory MessageTime({
    int? created,
    int? completed,
  }) = _MessageTime;

  factory MessageTime.fromJson(Map<String, dynamic> json) =>
      _$MessageTimeFromJson(json);
}

@freezed
class MessageInfo with _$MessageInfo {
  const factory MessageInfo({
    required String id,
    required String role,
    required String sessionID,
    @Default(0.0) double cost,
    String? error,
    MessageTime? time,
    String? parentID,
  }) = _MessageInfo;

  factory MessageInfo.fromJson(Map<String, dynamic> json) =>
      _$MessageInfoFromJson(json);
}

class StoredMessage {
  final MessageInfo info;
  final List<Part> parts;

  const StoredMessage({required this.info, required this.parts});

  StoredMessage copyWith({MessageInfo? info, List<Part>? parts}) {
    return StoredMessage(
      info: info ?? this.info,
      parts: parts ?? this.parts,
    );
  }
}
