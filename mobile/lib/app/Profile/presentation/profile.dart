import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobile/app/Auth/application/auth_provider.dart';
import 'package:mobile/app/FlashCard/application/flash_card_providers.dart';
import 'package:mobile/app/FlashCard/presentation/flash_card.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Profile/widgets/settings_list.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/utils/maybe.dart';

@RoutePage()
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  _showSettingsBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) => const SettingsList(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;

    final avatar = Maybe.fromValue(user?.photoURL)
        .map<ImageProvider>((photo) => NetworkImage(photo!))
        .getOrElse(const AssetImage('assets/images/account.png'));

    final flashCards = ref.watch(homeFlashCardsProvider);

    return Layout(
      // const TypeSetting('heeee'),
      flashCards.when(
        data: (data) => MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          itemCount: data.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FlashCardScreen(flashCard: data[index]),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(data[index].image_url),
                ),
                const SizedBox(
                  height: 4,
                ),
                TypeSetting(
                  data[index].word,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TypeSetting(
                  data[index].translated_word,
                  variant: TextVariants.bodySmall,
                )
              ],
            ),
          ),
        ),
        error: (error, _) => const TypeSetting('Error :('),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      currentScreen: CurrentScreens.profile.value,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                _showSettingsBottomSheet(context, ref);
              },
              child: CircleAvatar(
                backgroundImage: avatar,
              ),
            ),
          )
        ],
      ),
    );
  }
}
