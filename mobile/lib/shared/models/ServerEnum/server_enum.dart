import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_enum.freezed.dart';
part 'server_enum.g.dart';

/// Enum that represents a record from dictionary DB tables like `QuizCardStatuses`
@freezed
class ServerEnum with _$ServerEnum {
  const factory ServerEnum({
    required String id,
    required String name,
  }) = _ServerEnum;

  factory ServerEnum.fromJson(Map<String, dynamic> json) =>
      _$ServerEnumFromJson(json);
}
