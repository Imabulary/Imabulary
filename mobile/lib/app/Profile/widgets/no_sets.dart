import 'package:flutter/material.dart';
import 'package:Imabulary/atoms/type_setting.dart';

class NoSets extends StatelessWidget {
  const NoSets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TypeSetting(
          'No items found',
          variant: TextVariants.headlineLarge,
        ),
        SizedBox(
          height: 8,
        ),
        TypeSetting(
          "You haven't created any sets yet",
        )
      ],
    );
  }
}
