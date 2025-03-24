// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technical_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TechnicalDataDtoImpl _$$TechnicalDataDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TechnicalDataDtoImpl(
      deviceType: json['deviceType'] as String,
      deviceModel: json['deviceModel'] as String,
      osName: json['osName'] as String,
      osVersion: json['osVersion'] as String,
      appVersion: json['appVersion'] as String,
      appBuildNumber: json['appBuildNumber'] as String,
      networkType: json['networkType'] as String,
      screenResolution: json['screenResolution'] as String,
    );

Map<String, dynamic> _$$TechnicalDataDtoImplToJson(
        _$TechnicalDataDtoImpl instance) =>
    <String, dynamic>{
      'deviceType': instance.deviceType,
      'deviceModel': instance.deviceModel,
      'osName': instance.osName,
      'osVersion': instance.osVersion,
      'appVersion': instance.appVersion,
      'appBuildNumber': instance.appBuildNumber,
      'networkType': instance.networkType,
      'screenResolution': instance.screenResolution,
    };
