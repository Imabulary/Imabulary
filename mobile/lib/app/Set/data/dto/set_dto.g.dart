// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetDTOImpl _$$SetDTOImplFromJson(Map<String, dynamic> json) => _$SetDTOImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SetDTOImplToJson(_$SetDTOImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

_$FindAllSetsDTOImpl _$$FindAllSetsDTOImplFromJson(Map<String, dynamic> json) =>
    _$FindAllSetsDTOImpl(
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      filterStrategy: json['filterStrategy'] as String?,
      statusId: json['statusId'] as String?,
    );

Map<String, dynamic> _$$FindAllSetsDTOImplToJson(
        _$FindAllSetsDTOImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'filterStrategy': instance.filterStrategy,
      'statusId': instance.statusId,
    };
