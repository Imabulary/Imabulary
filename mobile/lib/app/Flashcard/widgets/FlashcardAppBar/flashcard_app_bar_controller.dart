import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/widgets/sets_list.dart';
import 'package:mobile/components/bottom_sheet_wrapper.dart';

class FlashcardAppBarController {
  static void Function() showSetsBottomSheet(BuildContext context) => () {
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
