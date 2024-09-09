// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageImpl _$$PackageImplFromJson(Map<String, dynamic> json) =>
    _$PackageImpl(
      id: json['id'] as String,
      externalId: json['externalId'] as String,
      name: json['name'] as String,
      coinsAmount: (json['coinsAmount'] as num).toInt(),
    );

Map<String, dynamic> _$$PackageImplToJson(_$PackageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'name': instance.name,
      'coinsAmount': instance.coinsAmount,
    };
