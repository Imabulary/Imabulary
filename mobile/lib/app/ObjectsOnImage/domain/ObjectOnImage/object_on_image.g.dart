// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_on_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObjectOnImageImpl _$$ObjectOnImageImplFromJson(Map<String, dynamic> json) =>
    _$ObjectOnImageImpl(
      name: json['name'] as String,
      score: (json['score'] as num).toDouble(),
      translatedName: json['translatedName'] as String,
    );

Map<String, dynamic> _$$ObjectOnImageImplToJson(_$ObjectOnImageImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'score': instance.score,
      'translatedName': instance.translatedName,
    };
