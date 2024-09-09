import 'package:flutter/material.dart';
import 'package:Imabulary/app/Wallet/presentation/wallet_screen.dart';
import 'package:Imabulary/atoms/colors.dart';
import 'package:Imabulary/atoms/type_setting.dart';

class NotEnoughCoinsDialog extends StatelessWidget {
  const NotEnoughCoinsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const TypeSetting(
        'Oops!',
        variant: TextVariants.headlineLarge,
      ),
      content: const TypeSetting(
        "You don't have enough coins to take new photo",
      ),
      actions: [
        TextButton(
          child: const TypeSetting(
            'Cancel',
            style: TextStyle(color: AppColors.primary),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const TypeSetting(
            'Buy Coins',
            style: TextStyle(color: AppColors.primary),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const WalletScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
