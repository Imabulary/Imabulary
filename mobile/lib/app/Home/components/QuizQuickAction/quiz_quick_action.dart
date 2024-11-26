import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Home/components/QuizQuickAction/quiz_quick_action_controller.dart';
import 'package:mobile/app/Home/components/QuizQuickAction/quiz_quick_action_list_item.dart';
import 'package:mobile/app/Set/application/set_provider.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

class QuizQuickAction extends ConsumerWidget {
  const QuizQuickAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setService = ref.read(setServiceProvider.notifier);
    final allSets = ref.watch(findAllSetsProvider(const Pagination()),);

    if (!allSets.isLoading) {
      final availableSets = allSets.value?.result.where((set) => (set.flashcards?.length ?? 0) > 1).toList();
      if (availableSets?.isEmpty ?? true) {
        return const QuizQuickActionListItem(
          'Take a Quiz',
          sublabel:
              'You have to create at least 1 set with minimum 2 flashcards to start a quiz',
          enabled: false,
        );
      }

      return QuizQuickActionListItem('Take a Quiz', onTap: () {
        if (availableSets!.length == 1) {
          setService.openSet(availableSets[0]);
          SetAppBarController.startQuiz(context, availableSets[0].flashcards)();
        } else {
          QuizQuickActionController.showAvailableSets(context, availableSets);
        }
      });
    }

    if (allSets.isLoading) {
      return const QuizQuickActionListItem(
        'Loading...',
      );
    }

    return const QuizQuickActionListItem(
      'Quick action temporary unavailable. Please try again later.',
    );
  }
}
