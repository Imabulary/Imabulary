import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';
import 'package:vector_graphics/vector_graphics.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.message,
    this.actionLabel,
    this.onActionPressed,
    this.icon = 'NoSets/no_sets.svg.vec',
  });

  final String message;
  final String? actionLabel;
  final String? icon;
  final void Function()? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture(
          AssetBytesLoader('assets/images/$icon'),
          width: 72,
          height: 72,
        ),
        const SizedBox(
          height: 12,
        ),
        TypeSetting(
          message,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12,
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
