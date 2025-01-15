import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_dto.freezed.dart';
part 'quiz_dto.g.dart';

@freezed
class UpdateQuizAnswerDTO with _$UpdateQuizAnswerDTO {
  const factory UpdateQuizAnswerDTO({
    required String cardId,
    required String word,
  }) = _UpdateQuizAnswerDTO;

  factory UpdateQuizAnswerDTO.fromJson(Map<String, dynamic> json) =>
      _$UpdateQuizAnswerDTOFromJson(json);
}
