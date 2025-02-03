// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateNoDiseredObjectDTOImpl _$$CreateNoDiseredObjectDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateNoDiseredObjectDTOImpl(
      imageUrl: json['imageUrl'] as String,
      objectsOnImage: (json['objectsOnImage'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CreateNoDiseredObjectDTOImplToJson(
        _$CreateNoDiseredObjectDTOImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'objectsOnImage': instance.objectsOnImage,
    };

_$FeedbackDTOImpl _$$FeedbackDTOImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackDTOImpl(
      message: json['message'] as String,
      deviceType: json['deviceType'] as String,
      deviceModel: json['deviceModel'] as String,
      osName: json['osName'] as String,
      osVersion: json['osVersion'] as String,
      appVersion: json['appVersion'] as String,
      buildNumber: json['buildNumber'] as String,
      networkType: json['networkType'] as String,
      screenResolution: json['screenResolution'] as String,
      userId: json['userId'] as String,
      userEmail: json['userEmail'] as String?,
      accountType: json['accountType'] as String?,
      subscriptionStatus: json['subscriptionStatus'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$FeedbackDTOImplToJson(_$FeedbackDTOImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'deviceType': instance.deviceType,
      'deviceModel': instance.deviceModel,
      'osName': instance.osName,
      'osVersion': instance.osVersion,
      'appVersion': instance.appVersion,
      'buildNumber': instance.buildNumber,
      'networkType': instance.networkType,
      'screenResolution': instance.screenResolution,
      'userId': instance.userId,
      'userEmail': instance.userEmail,
      'accountType': instance.accountType,
      'subscriptionStatus': instance.subscriptionStatus,
      'additionalData': instance.additionalData,
      'country': instance.country,
    };
