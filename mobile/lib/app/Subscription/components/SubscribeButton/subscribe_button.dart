import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Subscription/components/SubscribeButton/subscribe_button_controller.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button/button.dart';
import 'package:mobile/utils/async_value_ui.dart';

class SubscribeButton extends ConsumerWidget {
  const SubscribeButton({
    super.key,
    required this.productId,
    required this.qonversionId,
    this.disabled = false,
  });

  final String productId;
  final String? qonversionId;
  final bool? disabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(subscribeButtonControllerProvider, (_, state) {
      state.showErrorDialog(context, false);

      state.whenData((data) {
        AutoRouter.of(context).popUntilRoot();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.muted,
            content: TypeSetting(
              'Thanks! Enjoy studying without limits!✨',
            ),
          ),
        );
      });
    });

    final state = ref.watch(subscribeButtonControllerProvider);
    final isLoading = state.isLoading;

    final subscribe = () => ref
        .read(subscribeButtonControllerProvider.notifier)
        .subscribe(productId, qonversionId);

    return Button(
      label: 'Subscribe',
      expanded: true,
      onPressed: subscribe,
      variant: ButtonVariant.primary,
      size: ButtonSize.large,
      disabled: disabled ?? isLoading || qonversionId == null,
    );
  }
}
