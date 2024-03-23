import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/FlashCard/application/flash_card_providers.dart';
import 'package:mobile/app/Home/widgets/flash_cards_list.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/async_value_ui.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      homeFlashCardsProvider,
      (_, state) => state.showErrorDialog(context),
    );

    final flashCards = ref.watch(homeFlashCardsProvider);

    return Layout(
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TypeSetting(
              'Welcome to Imabulary!',
              variant: TextVariants.headlineLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            const TypeSetting('Your latest scans'),
            const SizedBox(
              height: 12,
            ),
            flashCards.when(
                data: (flashCards) => FlashCardsList(flashCards: flashCards),
                error: (error, _) => const Center(
                      child: TypeSetting(
                        'No scans yet',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                loading: () => const Center(child: CircularProgressIndicator()))
          ],
        ),
      ),
      currentScreen: CurrentScreens.home.value,
    );
  }
}
