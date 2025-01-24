import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';
import 'package:mobile/utils/logger.dart';
import 'package:mobile/utils/maybe.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

Future<T> request<T>(Future<T> Function() asyncFunc) async {
  try {
    return await asyncFunc();
  } on Exception catch (error, stackTrace) {
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

    if (error is QPurchaseException) {
      exception = Maybe.fromValue(error)
          .map(
            (result) => ServerError.fromJson({
              "statusCode": 400,
              "error": result.code,
              "message": result.message
            }),
          )
          .getOrElse(defaultError);
    }

    if (error is ServerError) {
      exception = error as ServerError;
    }

    appLogger.severe(exception, error, stackTrace);

    throw exception;
  }
}
