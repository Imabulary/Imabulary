import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_status.freezed.dart';
part 'quiz_status.g.dart';

@freezed
class QuizStatus with _$QuizStatus {
  const factory QuizStatus({
    required String id,
    required String name,
  }) = _QuizStatus;

  factory QuizStatus.fromJson(Map<String, dynamic> json) =>
      _$QuizStatusFromJson(json);
}
