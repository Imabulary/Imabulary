import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/bottom_sheet_wrapper.dart';
import 'package:mobile/components/button/button.dart';

class BottomDialog extends StatelessWidget {
  const BottomDialog({
    super.key,
    required this.title,
    this.subtitle,
    required this.body,
    required this.footer,
  });

  final String title;
  final String? subtitle;
  final List<Widget> body;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return BottomSheetWrapper(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypeSetting(
                    title,
                    variant: TextVariants.headlineLarge,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(
                      height: 4,
                    ),
                    TypeSetting(
                      subtitle!,
                    ),
                  ]
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Button(
                onPressed: () {
                  AutoRouter.of(context).maybePop();
                },
                variant: ButtonVariant.icon,
                icon: Icons.close,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        ...body,
        const SizedBox(
          height: 24,
        ),
        const Spacer(),
        footer,
      ],
    );
  }
}
