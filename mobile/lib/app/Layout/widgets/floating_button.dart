import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'AddBottomSheet/add_bottom_sheet.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key, required this.onPressed});

  final VoidCallback onPressed;
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.black,
      child: const Icon(Icons.add),
    );
  }
}
