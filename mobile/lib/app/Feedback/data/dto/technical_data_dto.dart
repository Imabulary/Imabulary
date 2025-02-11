import 'package:freezed_annotation/freezed_annotation.dart';

part 'technical_data_dto.freezed.dart';
part 'technical_data_dto.g.dart';

@freezed
class TechnicalDataDto with _$TechnicalDataDto {
  const factory TechnicalDataDto({
    required String deviceType,
    required String deviceModel,
    required String osName,
    required String osVersion,
    required String appVersion,
    required String appBuildNumber,
    required String networkType,
    required String screenResolution,
  }) = _TechnicalDataDto;

  factory TechnicalDataDto.fromJson(Map<String, dynamic> json) =>
      _$TechnicalDataDtoFromJson(json);
}
