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
