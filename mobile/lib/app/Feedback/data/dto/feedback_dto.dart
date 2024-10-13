import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_dto.freezed.dart';
part 'feedback_dto.g.dart';

@freezed
class CreateNoDiseredObjectDTO with _$CreateNoDiseredObjectDTO {
  const factory CreateNoDiseredObjectDTO({
    required String imageUrl,
    required List<String> objectsOnImage,
  }) = _CreateNoDiseredObjectDTO;

  factory CreateNoDiseredObjectDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateNoDiseredObjectDTOFromJson(json);
}
