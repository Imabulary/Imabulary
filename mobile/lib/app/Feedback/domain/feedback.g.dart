// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackImpl _$$FeedbackImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      cardId: json['cardId'] as String,
      isAppropriate: json['isAppropriate'] as bool,
      text: json['text'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$FeedbackImplToJson(_$FeedbackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'cardId': instance.cardId,
      'isAppropriate': instance.isAppropriate,
      'text': instance.text,
      'metadata': instance.metadata,
    };

_$FeedbackCategoryImpl _$$FeedbackCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedbackCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      meaning: json['meaning'] as String,
    );

Map<String, dynamic> _$$FeedbackCategoryImplToJson(
        _$FeedbackCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'meaning': instance.meaning,
    };
