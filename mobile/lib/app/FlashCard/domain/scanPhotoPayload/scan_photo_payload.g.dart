// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_photo_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScanPhotoPayloadImpl _$$ScanPhotoPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$ScanPhotoPayloadImpl(
      translatedObjectsOnImage:
          (json['translatedObjectsOnImage'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
      imageUrl: json['imageUrl'] as String,
      generatedImageName: json['generatedImageName'] as String,
    );

Map<String, dynamic> _$$ScanPhotoPayloadImplToJson(
        _$ScanPhotoPayloadImpl instance) =>
    <String, dynamic>{
      'translatedObjectsOnImage': instance.translatedObjectsOnImage,
      'imageUrl': instance.imageUrl,
      'generatedImageName': instance.generatedImageName,
    };
