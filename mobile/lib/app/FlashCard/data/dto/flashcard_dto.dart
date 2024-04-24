import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

part 'flashcard_dto.freezed.dart';
part 'flashcard_dto.g.dart';

@freezed
class OrganizeFlashcardDTO with _$OrganizeFlashcardDTO {
  const factory OrganizeFlashcardDTO({
    required String setId,
    required List<String> flashcardIds,
  }) = _OrganizeFlashcardDTO;

  factory OrganizeFlashcardDTO.fromJson(Map<String, dynamic> json) =>
      _$OrganizeFlashcardDTOFromJson(json);
}

@freezed
class FindAllFlashcardsDTO with _$FindAllFlashcardsDTO {
  const factory FindAllFlashcardsDTO({
    required Pagination pagination,
    String? setId,
  }) = _FindAllFlashcardsDTO;
}
