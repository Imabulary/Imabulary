import 'package:flutter/material.dart';
import 'package:mobile/app/Set/components/DeleteActionItem/delete_action_item.dart';
import 'package:mobile/app/Set/components/edit_action_item.dart';
import 'package:mobile/components/bottom_sheet_wrapper.dart';

class ActionsList extends StatelessWidget {
  const ActionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetWrapper(
      handleKeyboard: false,
      padding: const EdgeInsets.all(8),
      children: [
        ListView(
          shrinkWrap: true,
          children: const [EditActionItem(), DeleteActionItem()],
        ),
      ],
    );
  }
}
