import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Welcome/widgets/WelcomeScreenFooter/welcome_screen_footer_contoller.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button/button.dart';
import 'package:mobile/widgets/list_item.dart';

class SubscriptionLimitDialog extends StatelessWidget {
  const SubscriptionLimitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      'You reached free plan limit',
                      variant: TextVariants.headlineLarge,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TypeSetting(
                      'You created 5 flashcards today. Upgrade your account to unlock unlimited learning!',
                    ),
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
            height: 20,
          ),
          Row(
            children: [
              TypeSetting('Imabulary ', variant: TextVariants.headlineMedium),
              TypeSetting(
                'NEXT',
                variant: TextVariants.headlineMedium,
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          TypeSetting(
            '\$8 per month',
            variant: TextVariants.labelLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            children: [
              ListItem(
                leading: const Icon(
                  Icons.photo_camera_outlined,
                  size: 40,
                  color: Colors.white,
                ),
                label: '500',
                sublabel: 'Flashcards monthly',
                tileColor: AppColors.muted,
              ),
              const SizedBox(
                height: 8,
              ),
              ListItem(
                leading: const Icon(
                  Icons.perm_media_outlined,
                  size: 40,
                  color: Colors.white,
                ),
                label: '50',
                sublabel: 'Sets lifetime',
                tileColor: AppColors.muted,
              ),
              const SizedBox(
                height: 8,
              ),
              ListItem(
                leading: const Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 40,
                  color: Colors.white,
                ),
                label: 'Unlimited',
                sublabel: 'Flashcards in each set',
                tileColor: AppColors.muted,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
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
                'You can cancel the subscription anytime',
                variant: TextVariants.bodySmall,
                style: TextStyle(
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Spacer(),
          Button(
            label: 'Subscribe',
            expanded: true,
            onPressed: () {},
            variant: ButtonVariant.primary,
            size: ButtonSize.large,
          ),
        ],
      ),
    );
  }
}
