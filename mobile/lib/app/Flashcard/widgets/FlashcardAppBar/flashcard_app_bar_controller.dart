import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/widgets/sets_list.dart';
import 'package:mobile/app/Flashcard/widgets/setting_list.dart';

class FlashcardAppBarController {
  static void Function() showSetsBottomSheet(BuildContext context) => () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const Padding(
            padding: EdgeInsets.all(8),
            child: SetsList(),
          ),
        );
      };
  
  static void Function() showSettingsBottomSheet(BuildContext context) => () {
        showModalBottomSheet(
          isScrollControlled: true,
          clipBehavior: Clip.hardEdge,
          context: context,
          builder: (context) => const SettingsList(),
        );
      };
}
