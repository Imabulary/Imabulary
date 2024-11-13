import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class NoDesiredObectDialog extends StatelessWidget {
  const NoDesiredObectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const TypeSetting(
        'Oh no...',
        variant: TextVariants.headlineLarge,
      ),
      content: const TypeSetting(
        'We’re sorry that we couldn’t recognize your desired object. Please try another photo instead. Don’t worry, you were not charged for this image',
      ),
      actions: [
        TextButton(
          onPressed: () {
            AutoRouter.of(context).push(const MainRoute());
          },
          child: const TypeSetting(
            'Close',
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
        )
      ],
    );
  }
}
