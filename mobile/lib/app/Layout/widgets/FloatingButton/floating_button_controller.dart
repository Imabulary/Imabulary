import 'package:flutter/material.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet.dart';

class FloatingButtonController {
  static showCreateFlashcardBottomModal(BuildContext context) => () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          clipBehavior: Clip.hardEdge,
          builder: (context) => const AddBottomSheet(),
        );
      };
}
