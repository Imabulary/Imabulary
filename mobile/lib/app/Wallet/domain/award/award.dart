import 'package:freezed_annotation/freezed_annotation.dart';

part 'award.freezed.dart';
part 'award.g.dart';

@freezed
class CollectedAward with _$CollectedAward {
  const factory CollectedAward({
    required double currentBalance,
    required DateTime lastAwardedAt,
    required double nextAward,
    required int expirationTime,
  }) = _CollectedAward;

  factory CollectedAward.fromJson(Map<String, dynamic> json) =>
      _$CollectedAwardFromJson(json);
}

@freezed
class Award with _$Award {
  const factory Award({
    required String id,
    required String walletId,
    required DateTime lastAwardedAt,
    required int streekLevel,
    required int streekCount,
    required double award,
  }) = _Award;

  factory Award.fromJson(Map<String, dynamic> json) => _$AwardFromJson(json);
}
