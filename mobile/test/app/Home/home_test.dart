import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mobile/app/FlashCard/data/flash_card_repository.dart';
import 'package:mobile/app/Home/presentation/home.dart';
import 'package:mobile/app/Home/widgets/flash_cards_list.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../fixtures/flash_card.dart';
import '../../test_utils/test_app.dart';

void main() {
  dotenv.testLoad(fileInput: '''API_URL=https://api.com''');

  group('Home Screen', () {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);

    mockGet(int statusCode, Map<String, dynamic> data) {
      dioAdapter.onGet(
        'https://api.com/flash-cards',
        (server) => server.reply(
          statusCode,
          data,
        ),
      );
    }

    pumpHomeScreen(WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp(ProviderScope(
          overrides: [
            flashCardRepositoryProvider.overrideWith(
              (ref) => FlashCardRepository(client: dio),
            )
          ],
          child: const HomeScreen(),
        )),
      );
    }

    testWidgets(
      'should render list with flash cards when data is presented',
      (tester) async {
        mockNetworkImagesFor(() async {
          mockGet(200, {
            "result": [flashCardMapFixture]
          });

          await pumpHomeScreen(tester);

          final welcomeMessage = find.text('Welcome to Imabulary!');
          final latestScansText = find.text('Your latest scans');
          final loadingIndicator = find.byType(CircularProgressIndicator);

          expect(welcomeMessage, findsWidgets);
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

      await pumpHomeScreen(tester);

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
