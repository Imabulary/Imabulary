import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Set/components/quiz_flashcards_amount_warning.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/app/Set/widgets/actions_list.dart';
import 'package:mobile/app_router.dart';

const kMinimalAmountOfFlashcardsToStartQuiz = 2;

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
    List<SetFlashcard>? flashcards,
    {List<FlashCard>? flashcardsForQuiz}
  ) {
    return () {
      if (flashcards == null ||
          flashcards.length < kMinimalAmountOfFlashcardsToStartQuiz) {
        return showDialog(
          context: context,
          builder: (context) => const QuizFlashcardsAmountWarning(),
        );
      }

      AutoRouter.of(context).push(QuizRoute(flashcards: flashcardsForQuiz));
    };
  }
}
