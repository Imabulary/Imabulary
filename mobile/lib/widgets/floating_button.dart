import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/widgets/add_bottom_sheet.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  void handleAdd(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      builder: (context) => const AddBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        handleAdd(context);
      },
      backgroundColor: colors['primary'],
      foregroundColor: Colors.black,
      child: const Icon(Icons.add),
    );
  }
}
