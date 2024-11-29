import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_quiz_answer_dto.freezed.dart';
part 'update_quiz_answer_dto.g.dart';

@freezed
class UpdateQuizAnswerDTO with _$UpdateQuizAnswerDTO {
  const factory UpdateQuizAnswerDTO({
    required String cardId,
    required String word,
  }) = _UpdateQuizAnswerDTO;

  factory UpdateQuizAnswerDTO.fromJson(Map<String, dynamic> json) => _$UpdateQuizAnswerDTOFromJson(json);
}