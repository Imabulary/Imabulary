import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Home/components/FlashcardQuickAction/flashcard_quick_action_list_item.dart';
import 'package:mobile/app/Home/utils/constants.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/analytics_engine.dart';

class FlashcardQuickAction extends ConsumerWidget {
  const FlashcardQuickAction({super.key, required this.flashcards});

  final AsyncValue<ServerResponse<List<FlashCard>>> flashcards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleGenerateFlashcard({required bool isFirstFlashcard}) {
      analyticsEngine.trackClick(
        isFirstFlashcard
            ? AnalyticClickEvents.homeAddFirstFlashcard
            : AnalyticClickEvents.homeAddFlashcard,
      );
      showModalBottomSheet(
        context: context,
        clipBehavior: Clip.hardEdge,
        builder: (context) => const AddBottomSheet(),
      );
    }

    return flashcards.when(
      data: (data) => FlashcardQuickActionListItem(
        data.result.isEmpty
            ? 'Create your first flashcard'
            : 'Add new flashcard',
        onTap: () =>
            handleGenerateFlashcard(isFirstFlashcard: data.result.isEmpty),
      ),
      error: (error, _) => const FlashcardQuickActionListItem(
        kQuickActionUnavailableErrorTitle,
        sublabel: kQuickActionUnavailableErrorSubtitle,
      ),
      loading: () => const FlashcardQuickActionListItem(
        'Loading...',
      ),
    );
  }
}
