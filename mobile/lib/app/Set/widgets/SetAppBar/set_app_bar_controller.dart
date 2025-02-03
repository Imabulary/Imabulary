import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Set/components/quiz_flashcards_amount_warning.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/app/Set/widgets/actions_list.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/utils/analytics_engine.dart';

const kMinimalAmountOfFlashcardsToStartQuiz = 2;

class SetAppBarController {
  static void Function() showActionsBottomSheet(BuildContext context) => () {
        analyticsEngine.trackClick(AnalyticClickEvents.setSettings);
        showModalBottomSheet(
          clipBehavior: Clip.hardEdge,
          context: context,
          builder: (context) => const ActionsList(),
        );
      };

  static Future<void> startQuiz(
      BuildContext context, List<SetFlashcard>? flashcards,
      {List<FlashCard>? flashcardsForQuiz}) {
    {
      if (flashcards == null ||
          flashcards.length < kMinimalAmountOfFlashcardsToStartQuiz) {
        return showDialog(
          context: context,
          builder: (context) => const QuizFlashcardsAmountWarning(),
        );
      }

      return AutoRouter.of(context)
          .push(QuizRoute(flashcards: flashcardsForQuiz));
    }
  }
}
