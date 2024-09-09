import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:Imabulary/widgets/flash_card_masonry_item.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../fixtures/flash_card.dart';
import '../test_utils/test_app.dart';

void main() {
  group('FlashCardMasonryItem', () {
    testWidgets(
      'should render the masonry item and lead user to the flashcard screen when clicked',
      (tester) async {
        mockNetworkImagesFor(() async {
          await tester.pumpWidget(const TestApp(
            FlashCardMasonryItem(flashCardFixture),
            isScaffolded: true,
          ));

          final image = find.byType(Image);
          final word = find.text(flashCardFixture.word);
          final translatedWord = find.text(flashCardFixture.translated_word);

          expect(image, findsOneWidget);
          expect(word, findsWidgets);
          expect(translatedWord, findsWidgets);
        });
      },
    );
  });
}
