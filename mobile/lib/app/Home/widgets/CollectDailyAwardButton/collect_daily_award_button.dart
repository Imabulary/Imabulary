import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Home/widgets/CollectDailyAwardButton/collect_daily_award_button_controller.dart';
import 'package:mobile/app/Wallet/application/award_providers.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/async_value_ui.dart';

class CollectDailyAwardButton extends ConsumerWidget {
  const CollectDailyAwardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastAwardedAt = ref.watch(getLastAwardedAtProvider);

    // print(lastAwardedAt.asData?.value);

    ref.listen(collectDailyAwardButtonControllerProvider, (_, state) {
      state.showErrorDialog(context, false);
    });

    final state = ref.watch(collectDailyAwardButtonControllerProvider);
    final notifier = ref.watch(
      collectDailyAwardButtonControllerProvider.notifier,
    );

    final isLoading = state.isLoading;
    final isError = state.hasError;

    return ElevatedButton(
      onPressed: notifier.collect,
      child: TypeSetting(
        isLoading && !isError ? 'Collecting...' : 'Collect Daily Award',
        style: const TextStyle(color: AppColors.primary),
      ),
    );
  }
}
