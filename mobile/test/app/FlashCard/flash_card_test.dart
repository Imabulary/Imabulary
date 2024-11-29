import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/Flashcard/application/flashcard_service.dart';
import 'package:mobile/app/Flashcard/presentation/flashcard_screen.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../fixtures/flash_card.dart';
import '../../test_utils/test_app.dart';

class MockFlashcardService extends Mock implements FlashcardService {}

void main() {
  group('FlashCard Screen', () {
    testWidgets('should render flash card correctly', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(ProviderScope(
          overrides: [
            flashcardServiceProvider.overrideWith(() => MockFlashcardService())
          ],
          child: const TestApp(
            FlashcardScreen(),
          ),
        ));

        final image = find.byType(Image);
        final word = find.text(flashCardFixture.word);
        final relatedPhrase = find.text(flashCardFixture.phrase);
        final relatedPhraseTranslated = find.text(
          flashCardFixture.translated_phrase,
        );

        expect(image, findsOneWidget);
        expect(word, findsWidgets);
        expect(relatedPhrase, findsWidgets);
        expect(relatedPhraseTranslated, findsWidgets);
      });
    });
  });
}
