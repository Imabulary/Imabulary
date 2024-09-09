import 'package:flutter/material.dart';
import 'package:Imabulary/app/Flashcard/widgets/FlashcardAppBar/flashcard_app_bar_controller.dart';
import 'package:Imabulary/atoms/colors.dart';
import 'package:Imabulary/atoms/type_setting.dart';

class FlashcardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlashcardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ElevatedButton(
            onPressed: FlashcardAppBarController.showSetsBottomSheet(context),
            child: const TypeSetting(
              'Organize',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
