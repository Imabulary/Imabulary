import 'package:flutter/material.dart';
import 'package:Imabulary/atoms/colors.dart';
import 'AddBottomSheet/add_bottom_sheet.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  void _handleAdd(BuildContext context) {
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
        _handleAdd(context);
      },
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.black,
      child: const Icon(Icons.add),
    );
  }
}
