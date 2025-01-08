import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Home/components/QuizQuickAction/quiz_quick_action_controller.dart';
import 'package:mobile/app/Home/components/QuizQuickAction/quiz_quick_action_list_item.dart';
import 'package:mobile/app/Home/utils/constants.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/fp.dart';

class QuizQuickAction extends ConsumerWidget {
  const QuizQuickAction({super.key, required this.sets});

  final AsyncValue<ServerResponse<List<Set>>> sets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setService = ref.read(setServiceProvider.notifier);

    return sets.when(
      data: (sets) {
        final availableSets = sets.result
            .where((set) => (set.flashcards?.length ?? 0) > 1)
            .toList();

        return availableSets.isEmpty
            ? const QuizQuickActionListItem(
                'Take a Quiz',
                sublabel:
                    'You have to create at least 1 set with minimum 2 flashcards to start a quiz',
                enabled: false,
              )
            : QuizQuickActionListItem(
                'Take a Quiz',
                onTap: () {
                  if (isSingle(availableSets)) {
                    setService.openSet(availableSets[0]);
                    SetAppBarController.startQuiz(
                      context,
                      availableSets[0].flashcards,
                    );
                  } else {
                    QuizQuickActionController.showAvailableSets(
                      context,
                      availableSets,
                    );
                  }
                },
              );
      },
      error: (error, stackTrace) => const QuizQuickActionListItem(
        kQuickActionUnavailableErrorTitle,
        sublabel: kQuickActionUnavailableErrorSubtitle,
      ),
      loading: () => const QuizQuickActionListItem(
        'Loading...',
      ),
    );
  }
}
