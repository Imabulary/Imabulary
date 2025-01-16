// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionImpl _$$SubscriptionImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionImpl(
      id: json['id'] as String,
      storeId: json['storeId'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      benefits: Benefits.fromJson(json['benefits'] as Map<String, dynamic>),
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$SubscriptionImplToJson(_$SubscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storeId': instance.storeId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'benefits': instance.benefits,
      'icon': instance.icon,
    };
