import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/application/flashcard_providers.dart';
import 'package:mobile/app/Flashcard/data/dto/flashcard_dto.dart';
import 'package:mobile/app/Home/components/FlashcardQuickAction/flashcard_quick_action_list_item.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

class FlashcardQuickAction extends ConsumerWidget {
  const FlashcardQuickAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcards = ref.watch(findAllFlashcardsProvider(
      const FindAllFlashcardsDTO(pagination: Pagination()),
    ));

    void handleGenerateFlashcard() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        builder: (context) => const AddBottomSheet(),
      );
    }

    return flashcards.when(
      data: (data) => FlashcardQuickActionListItem(
        data.result.isEmpty
            ? 'Create your first flashcard'
            : 'Add new flashcard',
        onTap: handleGenerateFlashcard,
      ),
      error: (error, _) => FlashcardQuickActionListItem(
        'Something wrong with this quick action',
      ),
      loading: () => FlashcardQuickActionListItem(
        'Loading...',
      ),
    );
  }
}
