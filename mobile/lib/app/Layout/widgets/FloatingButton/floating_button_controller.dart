import 'package:flutter/material.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/utils/analytics_engine.dart';

class FloatingButtonController {
  static showCreateFlashcardBottomModal(BuildContext context) => () {
        analyticsEngine.trackClick(AnalyticClickEvents.bottomNavAddFlashcard);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          clipBehavior: Clip.hardEdge,
          builder: (context) => const AddBottomSheet(),
        );
      };
}
