import 'package:freezed_annotation/freezed_annotation.dart';

part 'award.freezed.dart';
part 'award.g.dart';

@freezed
class Award with _$Award {
  const factory Award({
    required double currentBalance,
    required DateTime lastAwardedAt,
    required double nextAward,
    required int expirationTime,
  }) = _Award;

  factory Award.fromJson(Map<String, dynamic> json) => _$AwardFromJson(json);
}
