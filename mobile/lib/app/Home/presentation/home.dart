import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Flashcard/application/flashcard_providers.dart';
import 'package:Imabulary/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:Imabulary/app/Home/widgets/flash_cards_list.dart';
import 'package:Imabulary/app/Layout/presentation/layout.dart';
import 'package:Imabulary/app/Layout/widgets/bottom_navigation.dart';
import 'package:Imabulary/atoms/type_setting.dart';
import 'package:Imabulary/shared/models/Pagination/pagination.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcards = ref.watch(findAllFlashcardsProvider(
      const FindAllFlashcardsDTO(pagination: Pagination()),
    ));

    return Layout(
      RefreshIndicator(
        onRefresh: () => Future.sync(
          () => ref.invalidate(findAllFlashcardsProvider),
        ),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // TODO: Return this button once we completely designed its businsess logic
                // const CollectDailyAwardButton(),
                // const SizedBox(
                //   height: 24,
                // ),
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
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                )
              ],
            ),
          ),
        ),
      ),
      currentScreen: CurrentScreens.home.value,
    );
  }
}
