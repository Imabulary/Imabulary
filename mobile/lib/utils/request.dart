import 'package:dio/dio.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';
import 'package:mobile/utils/maybe.dart';

Future<T> request<T>(Future<T> Function() asyncFunc) async {
  try {
    return await asyncFunc();
  } on Exception catch (error) {
    final exception = Maybe.fromValue(error)
        .map((result) => result is DioException ? result.response : null)
        .map((response) => response!.data)
        .map((data) => ServerError.fromJson(data))
        .getOrElse(
          const ServerError(
            statusCode: 500,
            message: ServerError.defaultError,
          ),
        );

    // TODO: log the full error to the external system
    print(error.toString());
    print(exception.toJson());

    throw exception;
  }
}
