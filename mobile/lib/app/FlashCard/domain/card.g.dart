// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlashCardImpl _$$FlashCardImplFromJson(Map<String, dynamic> json) =>
    _$FlashCardImpl(
      id: json['id'] as String,
      word: json['word'] as String,
      phrase: json['phrase'] as String,
      translated_phrase: json['translated_phrase'] as String,
      translated_word: json['translated_word'] as String,
      target_language: json['target_language'] as String,
      source_language: json['source_language'] as String,
      image_url: json['image_url'] as String,
      speech_part: json['speech_part'] as String?,
      translated_explanation: json['translated_explanation'] as String?,
      explanation: json['explanation'] as String?,
    );

Map<String, dynamic> _$$FlashCardImplToJson(_$FlashCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'phrase': instance.phrase,
      'translated_phrase': instance.translated_phrase,
      'translated_word': instance.translated_word,
      'target_language': instance.target_language,
      'source_language': instance.source_language,
      'image_url': instance.image_url,
      'speech_part': instance.speech_part,
      'translated_explanation': instance.translated_explanation,
      'explanation': instance.explanation,
    };
