import 'package:flutter/material.dart';
import 'package:mobile/app/Layout/widgets/FloatingButton/floating_button_controller.dart';
import 'package:mobile/atoms/colors.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed:
          FloatingButtonController.showCreateFlashcardBottomModal(context),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.black,
      child: const Icon(Icons.add),
    );
  }
}
