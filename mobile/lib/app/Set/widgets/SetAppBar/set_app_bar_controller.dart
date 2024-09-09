import 'package:flutter/material.dart';
import 'package:Imabulary/app/Quiz/presentation/QuizScreen/quiz_screen.dart';
import 'package:Imabulary/app/Set/components/quiz_flashcards_amount_warning.dart';
import 'package:Imabulary/app/Set/widgets/actions_list.dart';

class SetAppBarController {
  static void Function() showActionsBottomSheet(BuildContext context) => () {
        showModalBottomSheet(
          isScrollControlled: true,
          clipBehavior: Clip.hardEdge,
          context: context,
          builder: (context) => const ActionsList(),
        );
      };

  static Function() startQuiz(
    BuildContext context,
    List<({String image_url})>? flashcards,
  ) {
    return () {
      const kMinimalAmountOfFlashcardsToStartQuiz = 4;

      if (flashcards == null ||
          flashcards.isEmpty == true ||
          flashcards.length < kMinimalAmountOfFlashcardsToStartQuiz) {
        return showDialog(
          context: context,
          builder: (context) => const QuizFlashcardsAmountWarning(),
        );
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QuizScreen()),
      );
    };
  }
}
