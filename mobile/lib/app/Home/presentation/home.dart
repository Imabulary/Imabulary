import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Home/widgets/flash_cards_list.dart';
import 'package:mobile/app/Home/widgets/home_app_title.dart';
import 'package:mobile/app/Home/widgets/quick_actions.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Set/application/set_provider.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcards = ref.watch(findAllFlashcardsProvider(
      const FindAllFlashcardsDTO(pagination: Pagination(limit: 10)),
    ));

    return Layout(
      RefreshIndicator(
        onRefresh: () => Future.sync(() {
          ref.invalidate(getWalletBalanceProvider);
          ref.invalidate(findAllSetsProvider);
          ref.invalidate(findAllFlashcardsProvider);
        }),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HomeAppTitle(flashcards: flashcards),
                const SizedBox(
                  height: 24,
                ),
                const QuickActions(),
                const SizedBox(
                  height: 24,
                ),
                flashcards.when(
                  skipLoadingOnRefresh: false,
                  data: (flashcards) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (flashcards.result.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const TypeSetting(
                              'Your latest scans',
                              variant: TextVariants.headlineMedium,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      FlashCardsList(
                        flashCards: flashcards.result,
                      ),
                    ],
                  ),
                  error: (error, _) => const Center(
                    child: TypeSetting(
                      "Oops! An error occurred while loading your latest scans. But don't worry, we're on it! Try again later.",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
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
