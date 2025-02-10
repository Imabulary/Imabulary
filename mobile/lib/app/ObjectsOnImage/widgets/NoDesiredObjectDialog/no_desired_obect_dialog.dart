import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/atoms/analytic_click_events.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/analytics_engine.dart';

class NoDesiredObectDialog extends StatelessWidget {
  const NoDesiredObectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const TypeSetting(
        'We\'re sorry',
        variant: TextVariants.headlineLarge,
      ),
      content: const TypeSetting(
        "Our AI couldn't identify the object. Please try another photo instead, and let us know if the issue continues. Don't worry, you were not charged for this image.",
      ),
      actions: [
        TextButton(
          onPressed: () {
            analyticsEngine
                .trackClick(AnalyticClickEvents.noObjectsRecognizedClose);
            AutoRouter.of(context).popUntilRoot();
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
