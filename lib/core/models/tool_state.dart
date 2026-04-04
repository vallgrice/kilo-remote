import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_state.freezed.dart';
part 'tool_state.g.dart';

enum ToolStatus { pending, running, completed, error }

@freezed
class ToolState with _$ToolState {
  const factory ToolState({
    required ToolStatus status,
    @Default({}) Map<String, dynamic> input,
    dynamic output,
    String? error,
  }) = _ToolState;

  factory ToolState.fromJson(Map<String, dynamic> json) =>
      _$ToolStateFromJson(json);
}
