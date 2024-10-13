import 'package:flutter/material.dart';
import 'package:mobile/app/Home/presentation/home.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class NoDesiredObectDialog extends StatelessWidget {
  const NoDesiredObectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TypeSetting(
        'Oh no...',
        variant: TextVariants.headlineLarge,
      ),
      content: TypeSetting(
        'We’re sorry that we couldn’t recognize your desired object. Please try another photo instead. Don’t worry, you were not charged for this image',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: TypeSetting(
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
