import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Auth/domain/auth.dart';
import 'package:mobile/app/Welcome/presentation/welcome_screen_controller.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/utils/async_value_ui.dart';

class AnonymusLoginButton extends ConsumerWidget {
  const AnonymusLoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen((welcomeScreenControllerProvider), (_, state) {
      state.showErrorDialog(context, false);
    });

    final state = ref.watch(welcomeScreenControllerProvider);

    final handleAnonymusSignIn = () => state.isLoading
        ? null
        : ref
            .read(welcomeScreenControllerProvider.notifier)
            .login(AppAuthProvider.anonymus);

    return Button(
      key: const Key('anonymus-login'),
      onPressed: handleAnonymusSignIn,
      label: state.isLoading && !state.hasError
          ? 'Logging in...'
          : 'Sign in anonymously',
    );
  }
}
