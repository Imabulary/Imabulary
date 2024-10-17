import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/widgets/list_item.dart';

class QuizQuickActionListItem extends StatelessWidget {
  const QuizQuickActionListItem(
    this.label, {
    super.key,
    this.onTap,
    this.sublabel,
  });

  final String label;
  final String? sublabel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListItem(
      label: label,
      sublabel: sublabel,
      onTap: onTap,
      tileColor: AppColors.success,
      leading: const Icon(
        Icons.quiz_outlined,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
