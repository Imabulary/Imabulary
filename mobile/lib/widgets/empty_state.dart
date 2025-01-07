import 'package:flutter/material.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.message,
    this.actionLabel,
    this.onActionPressed,
  });

  final String message;
  final String? actionLabel;
  final void Function()? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TypeSetting(
          message,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8,
        ),
        if (actionLabel != null)
          Button(
            label: actionLabel!,
            onPressed: onActionPressed,
            icon: Icons.add,
          )
      ],
    );
  }
}
