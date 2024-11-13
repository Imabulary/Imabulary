import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Wallet/presentation/wallet_screen.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';

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
          onPressed: () => AutoRouter.of(context).maybePop(),
        ),
        ElevatedButton(
          child: const TypeSetting(
            'Buy Coins',
            style: TextStyle(color: AppColors.primary),
          ),
          onPressed: () {
            AutoRouter.of(context).push(const WalletRoute());
          },
        ),
      ],
    );
  }
}
