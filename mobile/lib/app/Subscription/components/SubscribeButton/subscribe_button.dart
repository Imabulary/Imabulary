import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Subscription/components/SubscribeButton/subscribe_button_controller.dart';
import 'package:mobile/components/button/button.dart';
import 'package:mobile/utils/async_value_ui.dart';

class SubscribeButton extends ConsumerWidget {
  const SubscribeButton({
    super.key,
    required this.productId,
    this.disabled = false,
  });

  final String? productId;
  final bool? disabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(subscribeButtonControllerProvider, (_, state) {
      state.showErrorDialog(context, false);
    });

    final state = ref.watch(subscribeButtonControllerProvider);
    final isLoading = state.isLoading;

    final subscribe = () => ref
        .read(subscribeButtonControllerProvider.notifier)
        .subscribe(productId);

    return Button(
      label: 'Subscribe',
      expanded: true,
      onPressed: subscribe,
      variant: ButtonVariant.primary,
      size: ButtonSize.large,
      disabled: disabled ?? isLoading || productId == null,
    );
  }
}
