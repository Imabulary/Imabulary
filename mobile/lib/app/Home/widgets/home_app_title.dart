import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Wallet/domain/wallet/wallet.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

class HomeAppTitle extends StatelessWidget {
  final AsyncValue<Wallet> wallet;

  const HomeAppTitle({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TypeSetting(
          "Welcome back 👋",
          variant: TextVariants.headlineLarge,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        wallet.when(
          data: (data) => Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const TypeSetting(
                  "\$",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              TypeSetting(
                data.balance.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          error: (error, _) => const Text(
            "Failed to fetch coins balance.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
            ),
          ),
          loading: () => const Text(
            "Loading...",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
