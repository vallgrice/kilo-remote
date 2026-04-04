import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class ActiveSession with _$ActiveSession {
  const factory ActiveSession({
    required String id,
    required String status,
    required String title,
    required String connectionId,
    String? gitUrl,
    String? gitBranch,
  }) = _ActiveSession;

  factory ActiveSession.fromJson(Map<String, dynamic> json) =>
      _$ActiveSessionFromJson(json);
}

@freezed
class SessionInfo with _$SessionInfo {
  const factory SessionInfo({
    required String id,
    String? parentID,
  }) = _SessionInfo;

  factory SessionInfo.fromJson(Map<String, dynamic> json) =>
      _$SessionInfoFromJson(json);
}
