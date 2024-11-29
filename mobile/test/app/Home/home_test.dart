import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Home/presentation/home.dart';
import 'package:mobile/app/Home/widgets/flash_cards_list.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../fixtures/flash_card.dart';
import '../../test_utils/mocks.dart';
import '../../test_utils/test_app.dart';

class FakeFlashCardsRepository extends MockFlashCardRepository {
  @override
  Future<ServerResponse<List<FlashCard>>> findAll(
    FindAllFlashcardsDTO findAllFlashcardsDTO,
  ) {
    return Future.value(ServerResponse(result: [flashCardFixture]));
  }
}

void main() {
  dotenv.testLoad(fileInput: '''API_URL=https://api.com''');
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('Home Screen', () {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);

    mockGet(int statusCode, Map<String, dynamic> data) {
      dioAdapter.onGet(
        'https://api.com/flashcards',
        (server) => server.reply(
          statusCode,
          data,
        ),
      );
    }

    pumpHomeScreen(WidgetTester tester, bool error) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            flashCardRepositoryProvider.overrideWith(
              (ref) => error
                  ? FlashCardRepository(dio: dio)
                  : FakeFlashCardsRepository(),
            )
          ],
          child: const TestApp(HomeScreen()),
        ),
      );
    }

    testWidgets(
      'should render list with flash cards when data is presented',
      (tester) async {
        mockNetworkImagesFor(() async {
          await pumpHomeScreen(tester, false);

          final latestScansText = find.text('Your latest scans');
          final loadingIndicator = find.byType(CircularProgressIndicator);

          expect(latestScansText, findsWidgets);
          expect(loadingIndicator, findsOneWidget);

          await tester.pumpAndSettle();

          final latestScansList = find.byType(FlashCardsList);
          expect(latestScansList, findsOneWidget);
        });
      },
    );

    testWidgets('should render dialog with error message', (tester) async {
      mockGet(400, encodedServerErrorResponse);

      await pumpHomeScreen(tester, true);

      final loadingIndicator = find.byType(CircularProgressIndicator);
      expect(loadingIndicator, findsOneWidget);

      await tester.pumpAndSettle();

      final errorMessage = find.text(
        "Oops! An error occurred during loading. But don't worry, we're on it! Try again later.",
      );
      expect(errorMessage, findsWidgets);
    });
  });
}
