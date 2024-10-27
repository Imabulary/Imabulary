// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizeFlashcardDTOImpl _$$OrganizeFlashcardDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganizeFlashcardDTOImpl(
      setId: json['setId'] as String,
      flashcardIds: (json['flashcardIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$OrganizeFlashcardDTOImplToJson(
        _$OrganizeFlashcardDTOImpl instance) =>
    <String, dynamic>{
      'setId': instance.setId,
      'flashcardIds': instance.flashcardIds,
    };

_$CreateFlashcardDTOImpl _$$CreateFlashcardDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFlashcardDTOImpl(
      objectOnImage: json['objectOnImage'] as String,
      imageUrl: json['imageUrl'] as String,
      imageName: json['imageName'] as String,
    );

Map<String, dynamic> _$$CreateFlashcardDTOImplToJson(
        _$CreateFlashcardDTOImpl instance) =>
    <String, dynamic>{
      'objectOnImage': instance.objectOnImage,
      'imageUrl': instance.imageUrl,
      'imageName': instance.imageName,
    };

_$DislikeFlashcardDTOImpl _$$DislikeFlashcardDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$DislikeFlashcardDTOImpl(
      id: json['id'] as String,
      text: json['text'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DislikeFlashcardDTOImplToJson(
        _$DislikeFlashcardDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'categories': instance.categories,
    };
