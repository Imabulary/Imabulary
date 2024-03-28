import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/FlashCard/data/flash_card_repository.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet_controller.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/flash_card.dart';
import '../../test_utils/mocks.dart';
import '../../test_utils/utils.dart';

void main() {
  late ProviderContainer container;
  late AddBottomSheetController controller;
  late XFile xFile;

  // a helper method to create a ProviderContainer that overrides the flashCardRepositoryProvider
  ProviderContainer makeProviderContainer(
    MockFlashCardRepository flashCardRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        flashCardRepositoryProvider.overrideWithValue(flashCardRepository),
      ],
    );

    addTearDown(container.dispose);

    return container;
  }

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(const AsyncLoading<int>());

    xFile = MockFile.createFile().xFile;

    registerFallbackValue(xFile);
  });

  final flashCardRepository = MockFlashCardRepository();

  setupController() {
    container = makeProviderContainer(flashCardRepository);
    controller = container.read(addBottomSheetControllerProvider.notifier);
  }

  group('AddBottomSheetController.scanPhoto', () {
    setUp(() {
      setupController();
    });

    test('initially should be in AsyncData', () {
      verifyNever(() => flashCardRepository.scanPhoto(any()));
      expect(controller.state, const AsyncData<void>(null));
    });

    test('data should be null if pickPhoto did not return an image', () {
      when(() => flashCardRepository.pickPhoto(ImageSource.gallery)).thenAnswer(
        (_) async => null,
      );

      controller.scanPhoto(ImageSource.gallery);

      verifyNever(() => flashCardRepository.scanPhoto(any()));
      expect(controller.state, const AsyncData<void>(null));
    });

    test('should set the data to the state', () async {
      when(() => flashCardRepository.pickPhoto(ImageSource.gallery)).thenAnswer(
        (_) async => xFile,
      );

      when(() => flashCardRepository.scanPhoto(xFile)).thenAnswer(
        (_) async => flashCardFixture,
      );

      await controller.scanPhoto(ImageSource.gallery);

      verify(() => flashCardRepository.scanPhoto(xFile)).called(1);
      // ignore: void_checks
      expect(controller.state, const AsyncData<void>(flashCardFixture));
    });
  });
}
