// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerErrorImpl _$$ServerErrorImplFromJson(Map<String, dynamic> json) =>
    _$ServerErrorImpl(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$ServerErrorImplToJson(_$ServerErrorImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'error': instance.error,
    };
