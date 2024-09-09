import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:Imabulary/shared/models/ServerError/server_error.dart';
import 'package:Imabulary/utils/maybe.dart';

Future<T> request<T>(Future<T> Function() asyncFunc) async {
  try {
    return await asyncFunc();
  } on Exception catch (error) {
    const defaultError = ServerError(
      statusCode: 500,
      message: ServerError.defaultError,
    );
    var exception = defaultError;

    if (error is DioException) {
      exception = Maybe.fromValue(error)
          .map((result) => result.response)
          .map((response) => response!.data)
          .map((data) => ServerError.fromJson(data))
          .getOrElse(defaultError);
    }

    if (error is PlatformException) {
      exception = Maybe.fromValue(error)
          .map(
            (result) => ServerError.fromJson({
              "statusCode": 400,
              "error": result.code,
              "message": result.message ?? ServerError.defaultError
            }),
          )
          .getOrElse(defaultError);
    }

    // TODO: log the full error to the external system
    print(error.toString());
    print(exception.toJson());

    throw exception;
  }
}
