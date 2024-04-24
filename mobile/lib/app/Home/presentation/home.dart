import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Home/widgets/flash_cards_list.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcards = ref.watch(findAllFlashcardsProvider(
      const FindAllFlashcardsDTO(pagination: Pagination()),
    ));

    return Layout(
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TypeSetting(
              'Your latest scans',
              variant: TextVariants.headlineMedium,
            ),
            const SizedBox(
              height: 12,
            ),
            flashcards.when(
              skipLoadingOnRefresh: false,
              data: (flashCards) => FlashCardsList(
                flashCards: flashCards.result,
              ),
              error: (error, _) => const Center(
                child: TypeSetting(
                  "Oops! An error occurred during loading. But don't worry, we're on it! Try again later.",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
      currentScreen: CurrentScreens.home.value,
    );
  }
}
