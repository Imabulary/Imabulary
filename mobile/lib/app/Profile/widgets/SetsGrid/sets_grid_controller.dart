import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/widgets/set_form.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/components/bottom_sheet_wrapper.dart';

class SetsGridController {
  static void Function({Set? set}) showSetFormBottomSheet(
    BuildContext context,
  ) {
    return ({Set? set}) {
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
