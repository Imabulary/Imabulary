import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/widgets/FlashcardAppBar/flashcard_app_bar_controller.dart';
import 'package:mobile/atoms/type_setting.dart';

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
              color: 'primary',
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
