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

@freezed
class CreateFlashcardDTO with _$CreateFlashcardDTO {
  const factory CreateFlashcardDTO({
    required String objectOnImage,
    required String imageUrl,
    required String imageName,
    bool? isRegeneration,
  }) = _CreateFlashcardDTO;

  factory CreateFlashcardDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateFlashcardDTOFromJson(json);
}

@freezed
class DislikeFlashcardDTO with _$DislikeFlashcardDTO {
  const factory DislikeFlashcardDTO({
    required String id,
    String? text,
    List<String>? categories,
  }) = _DislikeFlashcardDTO;

  factory DislikeFlashcardDTO.fromJson(Map<String, dynamic> json) =>
      _$DislikeFlashcardDTOFromJson(json);
}

@freezed
class LikeFlashcardDTO with _$LikeFlashcardDTO {
  const factory LikeFlashcardDTO({
    required String cardId,
    required bool isAppropriate,
  }) = _LikeFlashcardDTO;

  factory LikeFlashcardDTO.fromJson(Map<String, dynamic> json) =>
      _$LikeFlashcardDTOFromJson(json);
}
