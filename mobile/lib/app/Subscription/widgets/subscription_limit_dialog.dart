import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';

class SubscriptionLimitDialog extends StatelessWidget {
  const SubscriptionLimitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
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
                      'Do not postpone your progress. Gift yourself access to learning!',
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
                  variat: ButtonVariant.icon,
                  icon: Icons.close,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TypeSetting(
            'By subscribing you agree to the Terms of Service and Privacy Policy. You can cancel the subscription anytime',
            variant: TextVariants.bodySmall,
            style: TextStyle(
              color: AppColors.lightGrey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TypeSetting(
            'View all plans',
            variant: TextVariants.link,
            onTap: () {
              AutoRouter.of(context).push(SubscriptionRoute());
            },
          ),
        ],
      ),
    );
  }
}
