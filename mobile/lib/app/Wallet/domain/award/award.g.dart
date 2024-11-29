// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollectedAwardImpl _$$CollectedAwardImplFromJson(Map<String, dynamic> json) =>
    _$CollectedAwardImpl(
      currentBalance: (json['currentBalance'] as num).toDouble(),
      lastAwardedAt: DateTime.parse(json['lastAwardedAt'] as String),
      nextAward: (json['nextAward'] as num).toDouble(),
      expirationTime: (json['expirationTime'] as num).toInt(),
    );

Map<String, dynamic> _$$CollectedAwardImplToJson(
        _$CollectedAwardImpl instance) =>
    <String, dynamic>{
      'currentBalance': instance.currentBalance,
      'lastAwardedAt': instance.lastAwardedAt.toIso8601String(),
      'nextAward': instance.nextAward,
      'expirationTime': instance.expirationTime,
    };

_$AwardImpl _$$AwardImplFromJson(Map<String, dynamic> json) => _$AwardImpl(
      id: json['id'] as String,
      walletId: json['walletId'] as String,
      lastAwardedAt: DateTime.parse(json['lastAwardedAt'] as String),
      streekLevel: (json['streekLevel'] as num).toInt(),
      streekCount: (json['streekCount'] as num).toInt(),
      award: (json['award'] as num).toDouble(),
    );

Map<String, dynamic> _$$AwardImplToJson(_$AwardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'walletId': instance.walletId,
      'lastAwardedAt': instance.lastAwardedAt.toIso8601String(),
      'streekLevel': instance.streekLevel,
      'streekCount': instance.streekCount,
      'award': instance.award,
    };
