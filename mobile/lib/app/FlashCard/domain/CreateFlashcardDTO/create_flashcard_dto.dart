import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_flashcard_dto.freezed.dart';
part 'create_flashcard_dto.g.dart';

@freezed
class CreateFlashcardDTO with _$CreateFlashcardDTO {
  const factory CreateFlashcardDTO({
    required String objectOnImage,
    required String imageName,
    required String imageUrl,
  }) = _CreateFlashcardDTO;

  factory CreateFlashcardDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateFlashcardDTOFromJson(json);
}
