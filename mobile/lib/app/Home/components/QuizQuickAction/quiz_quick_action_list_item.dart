import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/widgets/list_item.dart';

class QuizQuickActionListItem extends StatelessWidget {
  const QuizQuickActionListItem(
    this.label, {
    super.key,
    this.onTap,
    this.sublabel,
    this.enabled = true,
  });

  final String label;
  final String? sublabel;
  final void Function()? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final disabledOpacity = enabled ? 1.0 : 0.5;

    return ListItem(
      label: label,
      sublabel: sublabel,
      onTap: onTap,
      tileColor: AppColors.success.withOpacity(disabledOpacity),
      textColor: Colors.white.withOpacity(disabledOpacity),
      leading: Icon(
        Icons.quiz_outlined,
        color: Colors.white.withOpacity(disabledOpacity),
        size: 40,
      ),
      enabled: enabled,
    );
  }
}
