import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission.freezed.dart';
part 'permission.g.dart';

@freezed
class PermissionRequest with _$PermissionRequest {
  const factory PermissionRequest({
    required String requestId,
    required String permission,
    @Default([]) List<String> patterns,
    @Default({}) Map<String, dynamic> metadata,
    @Default([]) List<String> always,
  }) = _PermissionRequest;

  factory PermissionRequest.fromJson(Map<String, dynamic> json) =>
      _$PermissionRequestFromJson(json);
}
