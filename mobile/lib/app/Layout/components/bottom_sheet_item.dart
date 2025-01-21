import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/Subscription/widgets/subscription_limit_dialog.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/atoms/type_setting.dart';

const kSingleFlashcardCost = 1;

class BottomSheetItem extends ConsumerWidget {
  const BottomSheetItem({
    super.key,
    this.scanPhoto,
    required this.title,
    required this.icon,
    required this.source,
  });

  final String title;
  final IconData icon;
  final ImageSource source;
  final void Function(ImageSource source, BuildContext context)? scanPhoto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(getWalletBalanceProvider).value;
    final isUserHasEnoughCoins =
        wallet != null && wallet.balance >= kSingleFlashcardCost;

    return ListTile(
      leading: Icon(icon),
      title: TypeSetting(title),
      subtitle: const TypeSetting(
        'Sometimes Imabulary may not be 100% accurate.',
        variant: TextVariants.bodySmall,
      ),
      onTap: () {
        // if (isUserHasEnoughCoins) {
        scanPhoto != null ? scanPhoto!(source, context) : null;
        // } else {
        //   showModalBottomSheet(
        //     context: context,
        //     isScrollControlled: true,
        //     clipBehavior: Clip.hardEdge,
        //     useSafeArea: true,
        //     builder: (context) =>
        //         SubscriptionLimitDialog('You created 5 flashcards today'),
        //   );
        // }
      },
    );
  }
}
