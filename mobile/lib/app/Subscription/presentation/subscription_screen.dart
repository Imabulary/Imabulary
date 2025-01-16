import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Subscription/application/subscription_provider.dart';
import 'package:mobile/app/Subscription/widgets/subscription_list_item.dart';
import 'package:mobile/components/app_top_bar.dart';
import 'package:mobile/components/error_state.dart';

@RoutePage()
class SubscriptionScreen extends ConsumerWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscriptions = ref.watch(findAllSubscriptions);

    return Layout(
      subscriptions.when(
        data: (subscriptions) => Column(
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final subscription = subscriptions[index];

                return subscription.isLeft
                    ? SubscriptionListItem(
                        subscription: subscription.left!,
                      )
                    : subscription.right;
              },
              itemCount: subscriptions.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 12),
            ),
          ],
        ),
        error: (error, stackTrace) => ErrorState(
          error: error,
          title: 'Failed to load subscriptions',
          onRefresh: () {
            ref.invalidate(findAllSubscriptions);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      appBar: AppTopBar(
        title: 'Subscriptions',
      ),
    );
  }
}
