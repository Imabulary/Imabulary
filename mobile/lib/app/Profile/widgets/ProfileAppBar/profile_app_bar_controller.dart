import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/widgets/flashcards_settings_list.dart';
import 'package:mobile/app/Profile/widgets/settings_list.dart';
import 'dart:async';

import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class ProfileAppBarController {
  static void Function() showSettingsBottomSheet(BuildContext context) => () {
        showModalBottomSheet(
          isScrollControlled: true,
          clipBehavior: Clip.hardEdge,
          context: context,
          builder: (context) => const SettingsList(),
        );
      };

  static void Function() showFlashcardsSettingsBottomSheet(
          BuildContext context, void Function()? toggleDeleteMode) =>
      () {
        showModalBottomSheet(
          isScrollControlled: true,
          clipBehavior: Clip.hardEdge,
          context: context,
          builder: (context) =>
              FlashcardsSettingsList(toggleDeleteMode: toggleDeleteMode),
        );
      };

  static bool _isSnackBarActive = false;

  static void Function() showDeleteSnackBar(
          BuildContext context, List<String> flashcardIds) =>
      () {
        if (_isSnackBarActive) return;

        _isSnackBarActive = true;
        int remainingSeconds = 5;
        Timer? timer;

        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xFF2C2C2C),
                duration: const Duration(seconds: 5),
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    timer ??=
                        Timer.periodic(const Duration(seconds: 1), (timer) {
                      if (remainingSeconds > 0) {
                        setState(() {
                          remainingSeconds--;
                        });
                      } else {
                        timer.cancel();
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      }
                    });

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: TypeSetting(
                                  '$remainingSeconds',
                                  variant: TextVariants.labelLarge,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const TypeSetting(
                              'Flashcard(-s) deleted',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            timer?.cancel();
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                          child: const TypeSetting(
                            'Undo',
                            variant: TextVariants.bodyLarge,
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
            .closed
            .then((_) {
          _isSnackBarActive = false;
        });
      };
}
