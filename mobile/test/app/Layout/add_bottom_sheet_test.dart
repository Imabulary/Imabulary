import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/FlashCard/data/flash_card_repository.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../fixtures/flash_card.dart';
import '../../test_utils/mocks.dart';
import '../../test_utils/test_app.dart';
import '../../test_utils/utils.dart';

void main() {
  pumpBottomSheet(WidgetTester tester) async {
    final flashCardRepository = MockFlashCardRepository();

    await tester.pumpWidget(TestApp(
      ProviderScope(
        overrides: [
          flashCardRepositoryProvider.overrideWithValue(
            flashCardRepository,
          )
        ],
        child: const AddBottomSheet(),
      ),
      isScaffolded: true,
    ));

    return flashCardRepository;
  }

  mockPickPhoto(
    MockFlashCardRepository flashCardRepository,
  ) {
    final xFile = MockFile.createFile().xFile;

    when(
      () => flashCardRepository.pickPhoto(ImageSource.camera),
    ).thenAnswer((_) async => xFile);

    return xFile;
  }

  group('AddBottomSheet', () {
    testWidgets(
      'should render a list with 2 options: "Take a photo" and "Choose from gallery"',
      (tester) async {
        await pumpBottomSheet(tester);

        final takePhoto = find.text('Take a photo');
        final chooseFromGallery = find.text('Choose from gallery');

        expect(takePhoto, findsWidgets);
        expect(chooseFromGallery, findsWidgets);
      },
    );

    testWidgets(
      'should lead user to the flashcard screen in case of successful image scanning',
      (tester) async {
        mockNetworkImagesFor(() async {
          final flashCardRepository = await pumpBottomSheet(tester);
          final takePhoto = find.byIcon(Icons.camera);
          final xFile = mockPickPhoto(flashCardRepository);

          when(() => flashCardRepository.scanPhoto(xFile)).thenAnswer(
            (_) async => flashCardFixture,
          );

          await tester.tap(takePhoto);

          await tester.pumpAndSettle();

          expect(find.text('hello'), findsWidgets);
        });
      },
    );

    testWidgets(
      'should show an error dialog in case photo scanning finished with the error',
      (tester) async {
        final flashCardRepository = await pumpBottomSheet(tester);
        final takePhoto = find.byIcon(Icons.camera);
        final xFile = mockPickPhoto(flashCardRepository);

        when(() => flashCardRepository.scanPhoto(xFile)).thenThrow(
          const ServerError(
            statusCode: 500,
            message: 'Internal Server Error',
          ),
        );

        await tester.tap(takePhoto);

        await tester.pumpAndSettle();

        expect(find.text('Internal Server Error'), findsWidgets);
      },
    );
  });
}
