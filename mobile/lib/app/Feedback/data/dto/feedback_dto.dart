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

@freezed
class FeedbackDTO with _$FeedbackDTO {
  const factory FeedbackDTO({
    required String message,
    required String deviceType,
    required String deviceModel,
    required String osName,
    required String osVersion,
    required String appVersion,
    required String buildNumber,
    required String networkType,
    required String screenResolution,
    required String userId,
    String? userEmail,
    String? accountType,
    String? subscriptionStatus,
    required String country,
  }) = _FeedbackDTO;

  factory FeedbackDTO.fromJson(Map<String, dynamic> json) =>
      _$FeedbackDTOFromJson(json);
}
