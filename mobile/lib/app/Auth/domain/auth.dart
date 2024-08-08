import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/app/Profile/domain/profile.dart';
import 'package:mobile/app/Wallet/domain/award/award.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class CreateUserResponse with _$CreateUserResponse {
  const factory CreateUserResponse({
    required Profile user,
    required Award award,
  }) = _CreateUserResponse;

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}
