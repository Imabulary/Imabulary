import 'package:flutter/material.dart';
import 'package:mobile/atoms/type_setting.dart';

class BetterResultsDialog extends StatelessWidget {
  const BetterResultsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: TypeSetting(
        'Tips on how to scan objects like a pro',
        variant: TextVariants.headlineLarge,
      ),
      content: TypeSetting(
        """1. Take a picture of one object at a time.
2. Make sure there's enough light before taking a photo.
3. Do not upload any private or explicit content.""",
      ),
    );
  }
}
