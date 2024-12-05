import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
class ProfileDTO with _$ProfileDTO {
  const factory ProfileDTO({
    required String uid,
    String? email,
  }) = _ProfileDTO;

  factory ProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileDTOFromJson(json);
}
