import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mobile/app/FlashCard/domain/card.dart';
import 'package:mobile/app/FlashCard/data/flash_card_repository.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';

const encodedFlashCardsJsonResponse = {
  "result": [
    {
      'id': '1',
      'word': 'hello',
      'phrase': 'Hello, how are you?',
      'translated_phrase': 'Hola, ¿cómo estás?',
      'translated_word': 'Hola',
      'target_language': 'Spanish',
      'source_language': 'English',
      'image_url': 'https://example.com/hello.png',
    }
  ]
};

const encodedServerErrorResponse = {
  "message": "Bad request. Try again",
  "statusCode": 400
};

const expectedFlashCardsFromJson = [
  FlashCard(
    id: '1',
    word: 'hello',
    phrase: 'Hello, how are you?',
    translated_phrase: 'Hola, ¿cómo estás?',
    translated_word: 'Hola',
    target_language: 'Spanish',
    source_language: 'English',
    image_url: 'https://example.com/hello.png',
  )
];

void main() {
  dotenv.testLoad(fileInput: '''API_URL=https://api.com''');

  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  final flashCardRepository = FlashCardRepository(client: dio);

  mockGet(int statusCode, Map<String, dynamic> payload) {
    dioAdapter.onGet(
      'https://api.com/flash-cards',
      (server) => server.reply(
        statusCode,
        payload,
      ),
    );
  }

  group('FlashCardRepository.findAll', () {
    callMethod() {
      return flashCardRepository.findAll(
        const Pagination(page: 1, limit: 10),
      );
    }

    test('it should return deserialized list of flash cards', () async {
      mockGet(200, encodedFlashCardsJsonResponse);

      final flashCards = await callMethod();

      expect(flashCards, expectedFlashCardsFromJson);
    });

    test(
      'it should throw ServerError in case server answered with the error',
      () async {
        mockGet(400, encodedServerErrorResponse);

        expect(
          () => callMethod(),
          throwsA(
            const ServerError(
              statusCode: 400,
              message: 'Bad request. Try again',
            ),
          ),
        );
      },
    );
  });
}
