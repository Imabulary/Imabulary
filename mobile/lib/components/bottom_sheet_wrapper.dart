import 'package:flutter/material.dart';

class BottomSheetWrapper extends StatelessWidget {
  const BottomSheetWrapper({
    super.key,
    required this.children,
    this.padding,
    this.handleKeyboard,
    this.crossAxisAlignment,
  });

  final List<Widget> children;
  final EdgeInsets? padding;
  final bool? handleKeyboard;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final double bottomPadding =
        handleKeyboard ?? true ? MediaQuery.viewInsetsOf(context).bottom : 0;

    return Padding(
      padding:
          padding?.copyWith(bottom: bottomPadding + (padding?.bottom ?? 0)) ??
              EdgeInsets.fromLTRB(24, 24, 24, bottomPadding + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
