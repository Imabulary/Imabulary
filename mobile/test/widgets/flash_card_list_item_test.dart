import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:Imabulary/app/Home/widgets/FlashcardListItem/flashcard_list_item.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../fixtures/flash_card.dart';
import '../test_utils/test_app.dart';

void main() {
  group('FlashCardListItem', () {
    testWidgets(
      'should render the list item and lead user to the flashcard screen when clicked',
      (tester) async {
        mockNetworkImagesFor(() async {
          await tester.pumpWidget(const TestApp(
            FlashCardListItem(flashCardFixture),
            isScaffolded: true,
          ));

          final image = find.byType(Image);
          final word = find.text(flashCardFixture.word);
          final translatedWord = find.text(flashCardFixture.translated_word);

          expect(image, findsOneWidget);
          expect(word, findsWidgets);
          expect(translatedWord, findsWidgets);

          await tester.tap(image);

          await tester.pumpAndSettle();

          final phrase = find.text(flashCardFixture.phrase);

          expect(phrase, findsWidgets);
        });
      },
    );
  });
}
