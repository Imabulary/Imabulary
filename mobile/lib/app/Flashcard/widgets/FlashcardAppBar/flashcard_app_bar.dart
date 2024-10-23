import 'package:flutter/material.dart';
import 'package:mobile/app/Feedback/presentation/feedback_screen.dart';
import 'package:mobile/app/Flashcard/widgets/FlashcardAppBar/flashcard_app_bar_controller.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class FlashcardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlashcardAppBar({super.key});

  _handleDislike(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FeedbackScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              ElevatedButton(
                onPressed:
                    FlashcardAppBarController.showSetsBottomSheet(context),
                child: const TypeSetting(
                  'Organize',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
              IconButton(
                onPressed: () => _handleDislike(context),
                icon: const Icon(Icons.thumb_down_outlined),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
