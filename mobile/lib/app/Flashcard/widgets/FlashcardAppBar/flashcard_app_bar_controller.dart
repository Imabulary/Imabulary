import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/widgets/sets_list.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/components/bottom_sheet_wrapper.dart';
import 'package:mobile/utils/analytics_engine.dart';

class FlashcardAppBarController {
  static void Function() showSetsBottomSheet(BuildContext context) => () {
        analyticsEngine.trackClick(AnalyticClickEvents.flashcardOrganize);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const BottomSheetWrapper(
              children: [
                Expanded(
                  child: SetsList(),
                ),
              ],
            );
          },
        );
      };
}
