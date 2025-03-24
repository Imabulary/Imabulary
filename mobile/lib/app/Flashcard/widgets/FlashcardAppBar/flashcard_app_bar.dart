import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/widgets/FlashcardAppBar/flashcard_app_bar_controller.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/utils/analytics_engine.dart';

class FlashcardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlashcardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Button(
        variat: ButtonVariant.icon,
        onPressed: () {
          analyticsEngine.trackClick(AnalyticClickEvents.flashcardReturn);
          AutoRouter.of(context).popUntilRoot();
        },
        icon: Icons.arrow_back,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  FlashcardAppBarController.showSetsBottomSheet(context)();
                },
                child: const TypeSetting(
                  'Organize',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
