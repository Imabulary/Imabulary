// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateUserResponseImpl _$$CreateUserResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateUserResponseImpl(
      user: Profile.fromJson(json['user'] as Map<String, dynamic>),
      award: Award.fromJson(json['award'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateUserResponseImplToJson(
        _$CreateUserResponseImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'award': instance.award,
    };
