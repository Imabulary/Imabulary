import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/url_launcher.dart';

class SubscriptionInfoFooter extends StatelessWidget {
  const SubscriptionInfoFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TypeSetting(
          'Your current plan will auto-renew monthly',
          style: TextStyle(
            color: AppColors.primary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 4,
        ),
        TypeSetting(
          'You can manage your payment method on the ',
          variant: TextVariants.bodySmall,
          style: TextStyle(color: AppColors.lightGrey),
          textAlign: TextAlign.justify,
        ),
        Wrap(
          children: [
            TypeSetting(
              'Subscriptions page',
              type: TextType.link,
              variant: TextVariants.bodySmall,
              style: TextStyle(color: AppColors.lightGrey),
              onTap: () async {
                if (Platform.isAndroid) {
                  await UrlLauncher.launch(
                    'https://play.google.com/store/account/subscriptions',
                  );
                } else if (Platform.isIOS) {
                  await UrlLauncher.launch(
                    'https://apps.apple.com/account/subscriptions',
                  );
                }
              },
              textAlign: TextAlign.justify,
            ),
            TypeSetting(
              ' in ${Platform.isAndroid ? 'Google Play' : 'AppStore'}',
              variant: TextVariants.bodySmall,
              style: TextStyle(color: AppColors.lightGrey),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ],
    );
  }
}
