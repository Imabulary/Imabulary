// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AwardImpl _$$AwardImplFromJson(Map<String, dynamic> json) => _$AwardImpl(
      currentBalance: (json['currentBalance'] as num).toDouble(),
      lastAwardedAt: DateTime.parse(json['lastAwardedAt'] as String),
      nextAward: (json['nextAward'] as num).toDouble(),
      expirationTime: json['expirationTime'] as int,
    );

Map<String, dynamic> _$$AwardImplToJson(_$AwardImpl instance) =>
    <String, dynamic>{
      'currentBalance': instance.currentBalance,
      'lastAwardedAt': instance.lastAwardedAt.toIso8601String(),
      'nextAward': instance.nextAward,
      'expirationTime': instance.expirationTime,
    };
