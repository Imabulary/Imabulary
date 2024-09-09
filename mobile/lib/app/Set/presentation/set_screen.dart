import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Imabulary/app/Layout/presentation/layout.dart';
import 'package:Imabulary/app/Profile/widgets/flashcards_grid.dart';
import 'package:Imabulary/app/Set/application/set_service.dart';
import 'package:Imabulary/app/Set/widgets/SetAppBar/set_app_bar.dart';
import 'package:Imabulary/app/Set/widgets/flashcard_actions.dart';

class SetScreen extends ConsumerWidget {
  const SetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final set = ref.watch(setServiceProvider);

    return Layout(
      FlashcardsGrid(
        onGridItemLongPress: (flashcardId) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            clipBehavior: Clip.hardEdge,
            builder: (context) => FlashcardActions(
              flashcardId: flashcardId,
            ),
          );
        },
        setId: set?.id,
      ),
      appBar: const SetAppBar(),
    );
  }
}
