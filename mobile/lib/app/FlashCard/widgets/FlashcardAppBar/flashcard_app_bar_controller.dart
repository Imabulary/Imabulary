import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/widgets/sets_list.dart';

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
}
