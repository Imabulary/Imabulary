import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Auth/application/auth_provider.dart';
import 'package:mobile/app/Profile/widgets/ProfileAppBar/profile_app_bar_controller.dart';
import 'package:mobile/app/Profile/widgets/ProfileAppTitle/profile_app_title.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/utils/maybe.dart';

class ProfileAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ProfileAppBar(this.tabController,
      {super.key,
      this.toggleDeleteMode,
      this.isDeleteMode = false,
      this.selectedFlashcards = const []});

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

    return AppBar(
        automaticallyImplyLeading: false,
        title: isDeleteMode
            ? TextButton(
                onPressed: toggleDeleteMode,
                child: const TypeSetting(
                  "Cancel",
                  style: TextStyle(color: AppColors.primary),
                ),
              )
            : const ProfileAppTitle(),
        actions: isDeleteMode
            ? [
                TypeSetting(
                  variant: TextVariants.bodyLarge,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  '${selectedFlashcards.length} Flashcards',
                ),
                const SizedBox(width: 30),
                TextButton(
                  onPressed: selectedFlashcards.isNotEmpty
                      ? ProfileAppBarController.showDeleteSnackBar(
                          context, selectedFlashcards)
                      : null,
                  child: Icon(
                    Icons.delete_forever,
                    color: selectedFlashcards.isNotEmpty
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ]
            : [
                GestureDetector(
                  onTap:
                      ProfileAppBarController.showSettingsBottomSheet(context),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: avatar,
                      ),
                    ],
                  ),
                ),
                AnimatedBuilder(
                  animation: tabController,
                  builder: (context, _) {
                    return tabController.index != 1
                        ? Button(
                            onPressed: () {
                              ProfileAppBarController
                                  .showFlashcardsSettingsBottomSheet(
                                context,
                                toggleDeleteMode,
                              );
                            },
                            icon: Icons.more_vert,
                            variat: ButtonVariant.icon,
                          )
                        : const SizedBox(width: 20);
                  },
                )
              ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: IgnorePointer(
            ignoring: isDeleteMode,
            child: TabBar(
              controller: tabController,
              tabs: const [
                Tab(text: 'Flashcards'),
                Tab(text: 'Sets'),
              ],
              labelColor:
                  isDeleteMode ? AppColors.primary.withOpacity(0.5) : null,
              unselectedLabelColor:
                  isDeleteMode ? Colors.white.withOpacity(0.5) : null,
              indicatorColor:
                  isDeleteMode ? AppColors.primary.withOpacity(0.5) : null,
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.8);
}
