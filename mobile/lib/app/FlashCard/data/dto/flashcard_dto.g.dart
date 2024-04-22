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
