// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      internalId: json['internalId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      externalId: json['externalId'] as String?,
      benefits: Benefits.fromJson(json['benefits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'internalId': instance.internalId,
      'name': instance.name,
      'description': instance.description,
      'externalId': instance.externalId,
      'benefits': instance.benefits,
    };

_$BenefitsImpl _$$BenefitsImplFromJson(Map<String, dynamic> json) =>
    _$BenefitsImpl(
      ads: json['ads'] as bool,
      sets: (json['sets'] as num).toInt(),
      coins: (json['coins'] as num).toInt(),
      coinsFrequency: json['coinsFrequency'] as String,
      flashcardsInSet: (json['flashcardsInSet'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BenefitsImplToJson(_$BenefitsImpl instance) =>
    <String, dynamic>{
      'ads': instance.ads,
      'sets': instance.sets,
      'coins': instance.coins,
      'coinsFrequency': instance.coinsFrequency,
      'flashcardsInSet': instance.flashcardsInSet,
    };
