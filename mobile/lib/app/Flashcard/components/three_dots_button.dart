import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/components/button.dart';

class ThreeDotsButton extends ConsumerWidget {
  final VoidCallback? onPressed;
  const ThreeDotsButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Button(
      onPressed: () => onPressed,
      icon: Icons.more_vert,
      variat: ButtonVariant.icon,
    );
  }
}
