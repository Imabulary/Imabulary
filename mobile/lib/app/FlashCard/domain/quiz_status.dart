import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_status.freezed.dart';
part 'quiz_status.g.dart';

@freezed
class QuizStatuses with _$QuizStatuses {
  const factory QuizStatuses({
    required String id,
    required String name,
  }) = _QuizStatuses;

  factory QuizStatuses.fromJson(Map<String, dynamic> json) =>
      _$QuizStatusesFromJson(json);
}
