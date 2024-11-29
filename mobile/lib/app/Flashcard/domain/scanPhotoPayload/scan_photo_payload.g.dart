// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_photo_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScanPhotoPayloadImpl _$$ScanPhotoPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$ScanPhotoPayloadImpl(
      objectsOnImage: (json['objectsOnImage'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      imageUrl: json['imageUrl'] as String,
      imageName: json['imageName'] as String,
      isRegeneration: json['isRegeneration'] as bool?,
    );

Map<String, dynamic> _$$ScanPhotoPayloadImplToJson(
        _$ScanPhotoPayloadImpl instance) =>
    <String, dynamic>{
      'objectsOnImage': instance.objectsOnImage,
      'imageUrl': instance.imageUrl,
      'imageName': instance.imageName,
      'isRegeneration': instance.isRegeneration,
    };
