// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
