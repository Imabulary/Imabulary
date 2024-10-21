import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

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

@freezed
class FindAllSetsDTO with _$FindAllSetsDTO {
  const factory FindAllSetsDTO({
    required Pagination pagination,
    String? filterStrategy,
    String? statusId,
  }) = _FindAllSetsDTO;

  factory FindAllSetsDTO.fromJson(Map<String, dynamic> json) =>
      _$FindAllSetsDTOFromJson(json);
}
