import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final Widget component;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const CardMenu({
    Key? key,
    required this.component,
    this.onTap,
    this.backgroundColor = Colors.yellow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: component
        ),
      ),
    );
  }
}
