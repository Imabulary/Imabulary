import 'dart:async';

import 'package:dio/dio.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';
import 'package:mobile/utils/maybe.dart';
import 'package:riverpod/riverpod.dart';

class FlashCardRepository {
  FlashCardRepository({required this.client});

  final Dio client;

  String get endpoint => '${dotenv.env['API_URL']}/flash-cards';

  Future<List<FlashCard>> findAll(Pagination pagination) async {
    try {
      final response = await client.get(
        endpoint,
        queryParameters: {"pagination": pagination.toJson()},
      );

      final List<dynamic> result = response.data!['result'];

      return result.map((result) => FlashCard.fromJson(result)).toList();
    } on DioException catch (error) {
      final exception = Maybe.fromValue(error.response)
          .map((response) => response!.data)
          .map((data) => ServerError.fromJson(data))
          .getOrElse(
            const ServerError(
              statusCode: 500,
              message: 'Network error. Try again later.',
            ),
          );

      throw exception;
    }
  }
}

final flashCardRepositoryProvider = Provider(
  (ref) => FlashCardRepository(client: Dio()),
);
