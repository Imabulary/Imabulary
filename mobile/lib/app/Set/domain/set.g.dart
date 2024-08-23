// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetImpl _$$SetImplFromJson(Map<String, dynamic> json) => _$SetImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      flashcards: (json['flashcards'] as List<dynamic>?)
          ?.map((e) => _$recordConvert(
                e,
                ($jsonValue) => (image_url: $jsonValue['image_url'] as String,),
              ))
          .toList(),
    );

Map<String, dynamic> _$$SetImplToJson(_$SetImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'flashcards': instance.flashcards
          ?.map((e) => <String, dynamic>{
                'image_url': e.image_url,
              })
          .toList(),
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
