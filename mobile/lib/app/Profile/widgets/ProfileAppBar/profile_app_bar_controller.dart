import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/widgets/settings_list.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/utils/analytics_engine.dart';

class ProfileAppBarController {
  static void Function() showSettingsBottomSheet(BuildContext context) => () {
        analyticsEngine.trackClick(AnalyticClickEvents.profileSettings);
        showModalBottomSheet(
          clipBehavior: Clip.hardEdge,
          context: context,
          builder: (context) => const SettingsList(),
        );
      };
}
