import 'package:flutter/material.dart';
import 'package:mobile/app/Subscription/domain/subscription/subscription.dart';
import 'package:mobile/app/Subscription/utils/constants.dart';
import 'package:mobile/app/Subscription/utils/subscription_utils.dart';
import 'package:mobile/app/Subscription/widgets/subscription_info_dialog.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/widgets/list_item.dart';

final icons = {
  "school_outlined": Icons.school_outlined,
  "rocket_launch_outlined": Icons.rocket_launch_outlined,
};

class SubscriptionListItem extends StatelessWidget {
  const SubscriptionListItem({super.key, required this.subscription});

  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    final isImabularyNext = subscription.storeId != null &&
        subscription.storeId! == kNextSubscriptionId;
    final textColor = isImabularyNext ? Colors.black : Colors.white;

    return ListItem(
      leading: Icon(
        icons[subscription.icon],
        size: 40,
        color: textColor,
      ),
      label: subscription.name,
      sublabel: getSubscriptionSubtitle(subscription.price),
      tileColor: isImabularyNext ? AppColors.darkYellow : AppColors.grey,
      textColor: textColor,
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          clipBehavior: Clip.hardEdge,
          useSafeArea: true,
          builder: (context) => SubscriptionInfoDialog(
            subscription: subscription,
          ),
        );
      },
    );
  }
}
