import 'package:flutter/material.dart';
import 'package:mobile/app/Wallet/presentation/wallet_screen.dart';

class ProfileAppTitleController {
  static void Function() redirectToFlashCardScreen(BuildContext context) => () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WalletScreen(),
          ),
        );
      };
}
