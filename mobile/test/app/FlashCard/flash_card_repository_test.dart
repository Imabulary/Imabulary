import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/FlashCard/data/flash_card_repository.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/flash_card.dart';
import '../../test_utils/utils.dart';

class FakeImagePicker extends Mock implements ImagePicker {}

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
    const encodedFlashCardsJsonResponse = {
      "result": [flashCardMapFixture]
    };

    const expectedFlashCardsFromJson = [flashCardFixture];

    callMethod() {
      return flashCardRepository.findAll(
        const Pagination(page: 1, limit: 10),
      );
    }

    test('should return deserialized list of flash cards', () async {
      mockGet(200, encodedFlashCardsJsonResponse);

      final flashCards = await callMethod();

      expect(flashCards, expectedFlashCardsFromJson);
    });

    test(
      'should throw ServerError in case server answered with the error',
      () async {
        mockGet(400, encodedServerErrorResponse);

        expect(
          () => callMethod(),
          throwsA(decodedServerError),
        );
      },
    );
  });

  group('FlashCardRepository.scanPhoto', () {
    const encodedFlashCardJsonResponse = {"result": flashCardMapFixture};

    mockFile(int statusCode, Map<String, dynamic> payload) async {
      final mockFile = MockFile.createFile(keepFile: true);
      final xFile = mockFile.xFile;

      final image = await MultipartFile.fromFile(xFile.path);
      final data = FormData.fromMap({
        'file': image,
      });

      dioAdapter.onPost(
        'https://api.com/upload',
        (server) => server.reply(statusCode, payload),
        data: data,
      );

      return mockFile;
    }

    test(
      'should return flashcard with the information about the image',
      () async {
        final mockedFile = await mockFile(200, encodedFlashCardJsonResponse);

        final flashCard = await flashCardRepository.scanPhoto(mockedFile.xFile);

        expect(flashCard, flashCardFixture);

        mockedFile.file.deleteSync();
      },
    );

    test(
      'should throw ServerError in case server answered with the error',
      () async {
        final mockedFile = await mockFile(400, encodedServerErrorResponse);

        expect(
          flashCardRepository.scanPhoto(mockedFile.xFile),
          throwsA(decodedServerError),
        );

        mockedFile.file.deleteSync();
      },
    );
  });
}
