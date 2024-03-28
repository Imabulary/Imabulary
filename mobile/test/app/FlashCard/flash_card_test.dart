import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/FlashCard/presentation/flash_card.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../fixtures/flash_card.dart';

void main() {
  group('FlashCard Screen', () {
    testWidgets('should render flash card correctly', (tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: FlashCardScreen(
              flashCard: flashCardFixture,
            ),
          ),
        );

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
