import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Auth/application/auth_provider.dart';
import 'package:mobile/app/Profile/widgets/ProfileAppBar/profile_app_bar_controller.dart';
import 'package:mobile/utils/maybe.dart';

class ProfileAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ProfileAppBar(this.tabController, {super.key});

  final TabController tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;

    final avatar = Maybe.fromValue(user?.photoURL)
        .map<ImageProvider>((photo) => NetworkImage(photo!))
        .getOrElse(const AssetImage('assets/images/account.png'));

    return AppBar(
      backgroundColor: Colors.black,
      actions: [
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
      bottom: TabBar(
        tabs: const [
          Tab(text: 'Flashcards'),
          Tab(text: 'Sets'),
        ],
        controller: tabController,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
