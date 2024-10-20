import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Home/components/QuizQuickAction/quiz_quick_action_controller.dart';
import 'package:mobile/app/Home/components/QuizQuickAction/quiz_quick_action_list_item.dart';
import 'package:mobile/app/Set/application/set_provider.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';

class QuizQuickAction extends ConsumerWidget {
  const QuizQuickAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inProgressSetsProvider = ref.watch(findInProgressSetsProvider);
    final notStudiedSets = ref.watch(findNotStudiedSetsProvider);
    final setService = ref.read(setServiceProvider.notifier);

    if (inProgressSetsProvider.hasValue && notStudiedSets.hasValue) {
      final sets = [...inProgressSetsProvider.value!, ...notStudiedSets.value!];

      if (sets.isEmpty) {
        return QuizQuickActionListItem(
          'Take a Quiz',
          sublabel:
              'You have to create at least 1 set with minimum 2 flashcards to start a quiz',
          enabled: false,
        );
      }

      return QuizQuickActionListItem('Take a Quiz', onTap: () {
        if (sets.length == 1) {
          setService.openSet(sets[0]);
          SetAppBarController.startQuiz(context, sets[0].flashcards)();
        } else {
          QuizQuickActionController.showAvailableSets(context, sets);
        }
      });
    }

    if (notStudiedSets.isLoading || inProgressSetsProvider.isLoading) {
      return QuizQuickActionListItem(
        'Loading...',
      );
    }

    return QuizQuickActionListItem(
      'Quick action temporary unavailable. Please try again later.',
    );
  }
}
