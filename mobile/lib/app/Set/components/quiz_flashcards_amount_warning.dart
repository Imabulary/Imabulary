import 'package:flutter/material.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:mobile/atoms/type_setting.dart';

class QuizFlashcardsAmountWarning extends StatelessWidget {
  const QuizFlashcardsAmountWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: TypeSetting(
        'Oops...',
        variant: TextVariants.titleLarge,
      ),
      content: TypeSetting(
        'You must have at least $kMinimalAmountOfFlashcardsToStartQuiz flashcards in the set to start a quiz',
      ),
    );
  }
}
