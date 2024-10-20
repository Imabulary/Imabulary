import 'package:flutter/material.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/app/Set/widgets/sets_quizzes_list.dart';

class QuizQuickActionController {
  static void showAvailableSets(BuildContext buildContext, List<Set> sets) {
    showModalBottomSheet(
      context: buildContext,
      isScrollControlled: true,
      builder: (context) => SetsQuizzesList(
        sets: sets,
      ),
    );
  }
}
