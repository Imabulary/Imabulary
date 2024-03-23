import 'package:flutter/material.dart';
import 'package:mobile/atoms/type_setting.dart';

class Dialogs {
  static Widget loading(String? message) => AlertDialog(
        content: Padding(
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

  static Widget error(String? error) => AlertDialog(
        title: const TypeSetting(
          "Oops! We're sorry",
          variant: TextVariants.headlineLarge,
          textAlign: TextAlign.center,
        ),
        content: TypeSetting(
          error ?? "Something hiccuped. We're on it! Try again later.",
          textAlign: TextAlign.center,
        ),
      );
}
