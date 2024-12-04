import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Auth/application/auth_provider.dart';
import 'package:mobile/app/Profile/widgets/ProfileAppBar/profile_app_bar_controller.dart';
import 'package:mobile/app/Profile/widgets/ProfileAppTitle/profile_app_title.dart';
import 'package:mobile/utils/maybe.dart';

class ProfileAppBar extends ConsumerWidget {
  const ProfileAppBar(
    this.tabController, {
    super.key,
    required this.isDeleteMode,
    required this.selectedFlashcards,
    this.toggleDeleteMode,
  });

  final TabController tabController;
  final void Function()? toggleDeleteMode;
  final bool isDeleteMode;
  final List<String> selectedFlashcards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;

    final avatar = Maybe.fromValue(user?.photoURL)
        .map<ImageProvider>((photo) => NetworkImage(photo!))
        .getOrElse(const AssetImage('assets/images/account.png'));

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ProfileAppTitle(),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: ProfileAppBarController.showSettingsBottomSheet(context),
                child: CircleAvatar(
                  backgroundImage: avatar,
                ),
              ),
            )
          ],
        ),
        TabBar(
          tabs: const [
            Tab(text: 'Flashcards'),
            Tab(text: 'Sets'),
          ],
          controller: tabController,
        ),
      ],
    );
  }
}
