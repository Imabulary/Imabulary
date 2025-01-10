import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/widgets/settings_list.dart';

class ProfileAppBarController {
  static void Function() showSettingsBottomSheet(BuildContext context) => () {
        showModalBottomSheet(
          clipBehavior: Clip.hardEdge,
          context: context,
          builder: (context) => const SettingsList(),
        );
      };
}
