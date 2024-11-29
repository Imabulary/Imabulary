import 'package:flutter/material.dart';
import 'package:mobile/app/Quiz/presentation/QuizScreen/widgets/quiz_progress_bar_widget.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';

class QuizAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const QuizAppBarWidget({
    super.key,
    required this.onBackPressed,
    required this.currentFlashcardIndex,
    required this.totalFlashcards,
  });

  final VoidCallback onBackPressed;
  final int currentFlashcardIndex;
  final int totalFlashcards;

  @override
  Widget build(BuildContext context) {
    final cardNumber = currentFlashcardIndex + 1;

    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Expanded(
          child: Row(
            children: [
              Button(
                variat: ButtonVariant.icon,
                onPressed: onBackPressed,
                icon: Icons.arrow_back,
              ),
              const SizedBox(width: 8),
              const TypeSetting('Quiz', variant: TextVariants.headlineLarge),
              const Spacer(),
              TypeSetting(
                '$cardNumber / $totalFlashcards',
                variant: TextVariants.headlineSmall,
              ),
              const SizedBox(width: 16),
            ],
          ),
        )
      ],
      bottom: QuizProgressBarWidget(
        currentValue: currentFlashcardIndex,
        totalValue: totalFlashcards,
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}