// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileDTOImpl _$$ProfileDTOImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDTOImpl(
      uid: json['uid'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$ProfileDTOImplToJson(_$ProfileDTOImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
    };

_$UpdateUserDTOImpl _$$UpdateUserDTOImplFromJson(Map<String, dynamic> json) =>
    _$UpdateUserDTOImpl(
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$$UpdateUserDTOImplToJson(_$UpdateUserDTOImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
    };
