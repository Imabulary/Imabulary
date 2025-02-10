import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Set/application/set_provider.dart';
import 'package:mobile/app/Set/application/set_service.dart';
import 'package:mobile/app/Set/utils/map_status.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar_controller.dart';
import 'package:mobile/app/Set/widgets/flashcards_group_widget.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/utils/analytics_engine.dart';

@RoutePage()
class SetScreen extends ConsumerWidget {
  const SetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final set = ref.watch(setServiceProvider);

    final setFlashcards = ref.watch(findSetFlashcardsProvider);
    final isEnoughFlashcards =
        (set?.flashcards?.length ?? 0) >= kMinimalAmountOfFlashcardsToStartQuiz;

    return Layout(
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Button(
              disabled: !isEnoughFlashcards,
              onPressed: () {
                analyticsEngine.trackClick(AnalyticClickEvents.setStartQuiz);
                SetAppBarController.startQuiz(
                  context,
                  set?.flashcards,
                );
              },
              label: 'Start quiz',
              expanded: true,
            ),
            if (!isEnoughFlashcards) ...[
              const SizedBox(height: 8),
              const TypeSetting(
                'You have to add at least 2 flashcards to start a quiz',
                variant: TextVariants.bodySmall,
                style: TextStyle(color: Colors.grey),
              ),
            ],
            const SizedBox(height: 16),
            setFlashcards.when(
              data: (data) => Column(
                children: data.entries
                    .map(
                      (flashcardsGroup) => FlashcardsGroupWidget(
                        flashCards: flashcardsGroup.value,
                        title:
                            '${mapStatus(flashcardsGroup.key)} (${flashcardsGroup.value.length})',
                      ),
                    )
                    .toList(),
              ),
              error: (error, stackTrace) {
                return const SizedBox.shrink();
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
      appBar: const SetAppBar(),
    );
  }
}
