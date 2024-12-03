import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Flashcard/domain/card/card.dart';
import 'package:mobile/app/Home/components/welcome_title.dart';
import 'package:mobile/app/Wallet/application/wallet_providers.dart';
import 'package:mobile/app/Wallet/components/balance.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';

class HomeAppTitle extends ConsumerWidget {
  const HomeAppTitle({
    super.key,
    required this.flashcards,
  });

  final AsyncValue<ServerResponse<List<FlashCard>>> flashcards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(getWalletBalanceProvider);

    final welcomeTitle =
        flashcards.hasValue && flashcards.value!.result.isNotEmpty
            ? const WelcomeTitle(customTitle: "Welcome back 👋")
            : const WelcomeTitle();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        welcomeTitle,
        // const SizedBox(width: 8),
        // wallet.when(
        //   data: (data) => Balance(data.balance),
        //   error: (error, _) => const Balance(0),
        //   loading: () => const Balance(0),
        // )
      ],
    );
  }
}
