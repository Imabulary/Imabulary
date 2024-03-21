import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'server_error.freezed.dart';
part 'server_error.g.dart';

@freezed
class ServerError with _$ServerError {
  const factory ServerError({
    required int statusCode,
    required String message,
    String? error,
  }) = _ServerError;

  factory ServerError.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorFromJson(json);
}
