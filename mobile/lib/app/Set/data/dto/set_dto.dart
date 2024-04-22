import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_dto.freezed.dart';
part 'set_dto.g.dart';

@freezed
class SetDTO with _$SetDTO {
  const factory SetDTO({
    String? name,
    String? description,
  }) = _SetDTO;

  factory SetDTO.fromJson(Map<String, dynamic> json) => _$SetDTOFromJson(json);
}
