import 'package:flutter/material.dart';
import 'package:mobile/atoms/type_setting.dart';

class AppDivider extends StatelessWidget {
  const AppDivider(this.text, {super.key});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return text == null
        ? const Divider()
        : Row(
            children: [
              Expanded(
                child: Divider(
                  height: 50,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              TypeSetting(text!),
              SizedBox(
                width: 8,
              ),
              Expanded(child: Divider()),
            ],
          );
  }
}
