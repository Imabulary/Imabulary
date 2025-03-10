import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/Layout/components/not_enough_coins_dialog.dart';
import 'package:mobile/app/Subscription/presentation/subscription_screen.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';

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
    // double w = wallet!.balance;

    void _showUpgradeModal(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (context) {
          return _UpgradeBottomSheet(
            title: "You reached free plan limit",
            description:
                "You created 5 flashcards today. Upgrade your account to unlock unlimited learning!",
            planName: "Imabulary Next",
            advantages: [
              "✔ Unlimited flashcards",
              "✔ AI-powered learning insights",
              "✔ Sync across all devices",
            ],
            onSubscribe: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubscriptionScreen(),
                ),
              );
            },
          );
        },
      );
    }

    return ListTile(
      leading: Icon(icon),
      title: TypeSetting(title),
      subtitle: const TypeSetting(
        'Sometimes Imabulary may not be 100% accurate.',
        variant: TextVariants.bodySmall,
      ),
      onTap: () {
        if (!isUserHasEnoughCoins) {
          scanPhoto != null ? scanPhoto!(source, context) : null;
        } else {
          _showUpgradeModal(context);
        }
      },
    );
  }
}

class _UpgradeBottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final String planName;
  final List<String> advantages;
  final VoidCallback onSubscribe;

  const _UpgradeBottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.planName,
    required this.advantages,
    required this.onSubscribe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom:
            MediaQuery.of(context).viewInsets.bottom, // Handle keyboard overlap
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              planName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: advantages
                  .map((advantage) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          advantage,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            Text(
              "By subscribing you agree to the Terms of Service and Privacy Policy. You can cancel the subscription anytime.",
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSubscribe,
                child: const Text("Subscribe"),
              ),
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
