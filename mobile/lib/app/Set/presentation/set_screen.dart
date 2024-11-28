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
import 'package:mobile/components/button.dart';

@RoutePage()
class SetScreen extends ConsumerWidget {
  const SetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final set = ref.watch(setServiceProvider);

    final setFlashcards = ref.watch(findSetFlashcardsProvider);

    return Layout(
      SingleChildScrollView(
        child: Column(
          children: [
            Button(
              onPressed: () => SetAppBarController.startQuiz(
                context,
                set?.flashcards,
              ),
              label: 'Start quiz',
              variat: ButtonVariant.elevatedExpanded,
            ),
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
