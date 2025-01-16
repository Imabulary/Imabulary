import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Subscription/application/subscription_provider.dart';
import 'package:mobile/app/Subscription/widgets/subscription_agreement.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button/button.dart';
import 'package:mobile/components/error_state.dart';
import 'package:mobile/widgets/bottom_dialog.dart';
import 'package:mobile/widgets/list_item.dart';

class SubscriptionLimitDialog extends ConsumerWidget {
  const SubscriptionLimitDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imabularyNextSubscription = ref.watch(findImabularyNextSubscription);

    return BottomDialog(
      title: 'You reached free plan limit',
      subtitle:
          'You created 5 flashcards today. Upgrade your account to unlock unlimited learning!',
      body: [
        imabularyNextSubscription.when(
          data: (subscription) => ErrorState(
            error: '',
            title: 'Failed to fetch subscription',
            onRefresh: () {
              ref.invalidate(findImabularyNextSubscription);
            },
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
      ),
    );
  }
}
