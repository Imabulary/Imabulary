import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/shared/models/ServerEnum/server_enum.dart';

part 'quiz.freezed.dart';

enum QuizStatuses { mastered, not_studied, still_learning }

@freezed
class QuizStatusesPayload with _$QuizStatusesPayload {
  const factory QuizStatusesPayload({
    required ServerEnum notStudied,
    required ServerEnum stillLearning,
    required ServerEnum mastered,
  }) = _QuizStatusesPayload;
}
