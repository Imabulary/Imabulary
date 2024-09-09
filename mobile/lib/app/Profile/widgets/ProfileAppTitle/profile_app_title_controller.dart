import 'package:flutter/material.dart';
import 'package:Imabulary/app/Wallet/presentation/wallet_screen.dart';

class ProfileAppTitleController {
  static void Function() redirectToWalletScreen(BuildContext context) => () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WalletScreen(),
          ),
        );
      };
}
