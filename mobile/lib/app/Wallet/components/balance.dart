import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class Balance extends StatelessWidget {
  const Balance(this.value, {super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.paid,
          color: AppColors.primary,
        ),
        const SizedBox(
          width: 4,
        ),
        TypeSetting(
          value.toString(),
          style: const TextStyle(color: AppColors.primary),
        ),
      ],
    );
  }
}
