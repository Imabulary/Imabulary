import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_dto.freezed.dart';
part 'feedback_dto.g.dart';

@freezed
class CreateFeedbackDTO with _$CreateFeedbackDTO {
  const factory CreateFeedbackDTO({
    required String text,
    required Map<String, dynamic> metadata,
  }) = _CreateFeedbackDTO;

  factory CreateFeedbackDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateFeedbackDTOFromJson(json);
}
