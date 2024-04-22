import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/Flashcard/data/flash_card_repository.dart';
import 'package:mobile/app/Profile/presentation/profile_screen_controller.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/flash_card.dart';
import '../../test_utils/mocks.dart';

void main() {
  late ProviderContainer container;
  late ProfileScreenController controller;

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

  final flashCardRepository = MockFlashCardRepository();

  setupController() {
    container = makeProviderContainer(flashCardRepository);
    controller = container.read(profileScreenControllerProvider.notifier);
  }

  setUp(() {
    setupController();
  });

  mockServerResponse() {
    final serverResponseFixture = ServerResponse(
      result: [flashCardFixture],
      totalItems: 10,
    );

    when(
      () => flashCardRepository.findAll(
        const Pagination(page: 1, limit: 10),
      ),
    ).thenAnswer(
      (_) async => serverResponseFixture,
    );
  }

  group('ProfileScreenController.findUserFlashcards', () {
    test(
      'should append items to the page',
      () async {
        final pagingController = MockFlashCardPagingController();

        when(() => pagingController.firstPageKey).thenReturn(1);

        mockServerResponse();

        await controller.findUserFlashcards(
          pagingController.firstPageKey,
          pagingController,
        );

        verify(
          () => pagingController.appendPage([flashCardFixture], 2),
        ).called(1);
      },
    );

    test(
      'should append items to the last page',
      () async {
        final pagingController = MockFlashCardPagingController();

        when(() => pagingController.firstPageKey).thenReturn(1);
        when(() => pagingController.itemList).thenReturn(
          List.generate(10, (index) => flashCardFixture),
        );

        mockServerResponse();

        await controller.findUserFlashcards(
          pagingController.firstPageKey,
          pagingController,
        );

        verify(
          () => pagingController.appendLastPage([flashCardFixture]),
        ).called(1);
      },
    );
  });
}
