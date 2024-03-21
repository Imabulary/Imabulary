import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/FlashCard/application/flash_card_providers.dart';
import 'package:mobile/app/layout.dart';
import 'package:mobile/app/profile.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';
import 'package:mobile/widgets/bottom_navigation.dart';
import 'package:mobile/widgets/flash_card_list_item.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                data: (data) => Column(
                      children: [
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              FlashCardListItem(data[index]),
                          itemCount: data.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(height: 12),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if (data.isNotEmpty)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfileScreen(),
                                    ),
                                  );
                                },
                                child: const TypeSetting('View all'),
                              ),
                            ),
                          ),
                      ],
                    ),
                error: (error, _) {
                  final serverError = error as ServerError;

                  return TypeSetting(serverError.message);
                },
                loading: () => const Center(child: CircularProgressIndicator()))
          ],
        ),
      ),
      currentScreen: CurrentScreens.home.value,
    );
  }
}
