import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Profile/application/user_provider.dart';
import 'package:mobile/app/Subscription/components/SubscribeButton/subscribe_button.dart';
import 'package:mobile/app/Subscription/components/subscription_info_footer.dart';
import 'package:mobile/app/Subscription/domain/subscription/subscription.dart';
import 'package:mobile/app/Subscription/utils/constants.dart';
import 'package:mobile/app/Subscription/utils/subscription_utils.dart';
import 'package:mobile/app/Subscription/widgets/benefits_list.dart';
import 'package:mobile/app/Subscription/widgets/subscription_agreement.dart';
import 'package:mobile/components/error_state.dart';
import 'package:mobile/widgets/bottom_dialog.dart';

class SubscriptionInfoDialog extends ConsumerWidget {
  const SubscriptionInfoDialog({
    super.key,
    required this.subscription,
  });

  final Subscription subscription;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserSubscription = ref.watch(
      findCurrentUserSubscriptionProvider,
    );

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
      footer: subscription.storeId == null
          ? Container()
          : currentUserSubscription.when(
              data: (currentSubscription) =>
                  currentSubscription.id == subscription.id
                      ? SubscriptionInfoFooter()
                      : SubscribeButton(
                          qonversionId: subscription.storeId,
                          productId: subscription.id,
                        ),
              error: (error, stackTrace) => ErrorState(
                error: error,
                onRefresh: () {
                  ref.invalidate(findCurrentUserSubscriptionProvider);
                },
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
