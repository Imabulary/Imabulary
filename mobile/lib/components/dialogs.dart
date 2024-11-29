import 'package:flutter/material.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.title,
    this.content,
    this.customContent,
    this.actions,
    this.onSubmit,
    this.noSubmit = false,
    this.noActions = false,
    this.cancelText,
    this.submitText,
  });

  final String? title;
  final String? content;
  final Widget? customContent;
  final List<Widget>? actions;
  final void Function()? onSubmit;
  final bool noSubmit;
  final bool noActions;
  final String? cancelText;
  final String? submitText;

  @override
  Widget build(BuildContext context) {
    final customActions = actions ??
        [
          Button(
            onPressed: () => Navigator.pop(context),
            label: cancelText ?? 'Close',
            variat: ButtonVariant.text,
          ),
          if (!noSubmit)
            Button(onPressed: onSubmit, label: submitText ?? 'Submit')
        ];

    return AlertDialog(
      title: title != null
          ? TypeSetting(
              title!,
              variant: TextVariants.headlineLarge,
            )
          : null,
      content: customContent ?? TypeSetting(content ?? ''),
      actions: noActions ? null : customActions,
    );
  }
}

class Dialogs {
  static Widget loading(String? message) => AppDialog(
        noActions: true,
        customContent: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 24,
              ),
              TypeSetting(
                message ?? 'Awesomeness is loading, wait a second...',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );

  static Widget error(String error) => AppDialog(
        title: "Oops! We're sorry",
        content: error.isNotEmpty
            ? error
            : "Something hiccuped. Don't worry, we're on it! Try again later.",
        noActions: true,
      );
}
