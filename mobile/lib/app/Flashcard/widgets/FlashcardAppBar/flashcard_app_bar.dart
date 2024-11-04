import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/components/dislike_button.dart';
import 'package:mobile/app/Flashcard/widgets/FlashcardAppBar/flashcard_app_bar_controller.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';

class FlashcardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlashcardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Button(
        variat: ButtonVariant.icon,
        onPressed: () => AutoRouter.of(context).maybePop(), 
        icon: Icons.arrow_back,),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: FlashcardAppBarController.showSetsBottomSheet(
                  context,
                ),
                child: const TypeSetting(
                  'Organize',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
              const DislikeButton()
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
