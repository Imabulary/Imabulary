import 'package:flutter/material.dart';
import 'package:mobile/app/Welcome/widgets/WelcomeScreenFooter/welcome_screen_footer_contoller.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class SubscriptionAgreement extends StatelessWidget {
  const SubscriptionAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TypeSetting(
          'By subscribing you agree to the ',
          variant: TextVariants.bodySmall,
          style: TextStyle(
            color: AppColors.lightGrey,
          ),
        ),
        TypeSetting(
          'Terms of Service',
          variant: TextVariants.bodySmall,
          type: TextType.link,
          onTap: WelcomeScreenFooterContoller.openTerms(context),
        ),
        TypeSetting(
          ' and ',
          variant: TextVariants.bodySmall,
          style: TextStyle(
            color: AppColors.lightGrey,
          ),
        ),
        TypeSetting(
          'Privacy Policy',
          variant: TextVariants.bodySmall,
          type: TextType.link,
          onTap: WelcomeScreenFooterContoller.openPrivacyPolicy(context),
        ),
        TypeSetting(
          '. You can cancel the subscription anytime.',
          variant: TextVariants.bodySmall,
          style: TextStyle(
            color: AppColors.lightGrey,
          ),
        ),
      ],
    );
  }
}
