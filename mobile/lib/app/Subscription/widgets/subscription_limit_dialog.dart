import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Subscription/application/subscription_provider.dart';
import 'package:mobile/app/Subscription/utils/subscription_utils.dart';
import 'package:mobile/app/Subscription/widgets/benefits_list.dart';
import 'package:mobile/app/Subscription/widgets/subscription_agreement.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button/button.dart';
import 'package:mobile/components/error_state.dart';
import 'package:mobile/widgets/bottom_dialog.dart';

class SubscriptionLimitDialog extends ConsumerWidget {
  const SubscriptionLimitDialog(this.limitReason, {super.key});

  final String limitReason;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imabularyNextSubscription = ref.watch(findImabularyNextSubscription);

    return BottomDialog(
      title: 'You reached free plan limit',
      subtitle:
          '$limitReason. Upgrade your account to unlock unlimited learning!',
      body: [
        imabularyNextSubscription.when(
          data: (subscription) => subscription.isLeft
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TypeSetting('Imabulary ',
                            variant: TextVariants.headlineMedium),
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
                      getSubscriptionSubtitle(subscription.left!.price),
                      variant: TextVariants.labelLarge,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    BenefitsList(benefits: subscription.left!.benefits),
                    const SizedBox(
                      height: 8,
                    ),
                    SubscriptionAgreement()
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          error: (error, _) => ErrorState(
            error: error,
            title: 'Failed to fetch subscription',
            onRefresh: () {
              ref.invalidate(findImabularyNextSubscription);
            },
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
      footer: Button(
        label: 'Subscribe',
        expanded: true,
        onPressed: () {},
        variant: ButtonVariant.primary,
        size: ButtonSize.large,
        disabled: imabularyNextSubscription.isLoading ||
            imabularyNextSubscription.hasError,
      ),
    );
  }
}
