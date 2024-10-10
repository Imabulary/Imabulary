import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/widgets/list_item.dart';

class NoDesiredObject extends StatelessWidget {
  const NoDesiredObject({super.key});

  @override
  Widget build(BuildContext context) {
    return ListItem(
      onTap: () {},
      tileColor: AppColors.muted,
      label: 'The object I wanted is not in this list',
    );
  }
}
