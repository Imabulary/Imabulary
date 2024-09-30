import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final Widget leftComponent;
  final Widget rightComponent;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const CardMenu({
    Key? key,
    required this.leftComponent,
    required this.rightComponent,
    this.onTap,
    this.backgroundColor = Colors.yellow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Card(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: leftComponent,
                    ),
                  ),
                ),
                rightComponent,
              ],
            ),
          ),
        ));
  }
}
