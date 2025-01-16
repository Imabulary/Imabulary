import 'package:flutter/material.dart';
import 'package:mobile/app/Subscription/domain/subscription/subscription.dart';
import 'package:mobile/app/Subscription/utils/subscription_utils.dart';
import 'package:mobile/app/Subscription/widgets/benefits_list.dart';
import 'package:mobile/app/Subscription/widgets/subscription_agreement.dart';
import 'package:mobile/components/button/button.dart';
import 'package:mobile/widgets/bottom_dialog.dart';

class SubscriptionInfoDialog extends StatelessWidget {
  const SubscriptionInfoDialog({
    super.key,
    required this.subscription,
  });

  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    print(subscription.benefits);

    return BottomDialog(
      title: subscription.name,
      subtitle: getSubscriptionSubtitle(subscription.price),
      body: [
        BenefitsList(benefits: subscription.benefits),
        const SizedBox(
          height: 16,
        ),
        SubscriptionAgreement(),
      ],
      footer: Button(
        label: 'Subscribe',
        expanded: true,
        onPressed: () {},
        variant: ButtonVariant.primary,
        size: ButtonSize.large,
      ),
    );
  }
}
