import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/widgets/set_form.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/components/bottom_sheet_wrapper.dart';
import 'package:mobile/utils/analytics_engine.dart';

class SetsGridController {
  static void Function({Set? set}) showSetFormBottomSheet(
    BuildContext context,
  ) {
    return ({Set? set}) {
      analyticsEngine.trackClick(AnalyticClickEvents.homeCreateFirstSet);
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return BottomSheetWrapper(
            children: [
              SetForm(set),
            ],
          );
        },
      );
    };
  }
}
