import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Auth/domain/auth.dart';
import 'package:mobile/app/Welcome/presentation/welcome_screen_controller.dart';
import 'package:mobile/utils/async_value_ui.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleLoginButton extends ConsumerWidget {
  const AppleLoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen((welcomeScreenControllerProvider), (_, state) {
      state.showErrorDialog(context, false);
    });

    final state = ref.watch(welcomeScreenControllerProvider);

    handleAppleSignIn() => state.isLoading
        ? null
        : ref
            .read(welcomeScreenControllerProvider.notifier)
            .login(AppAuthProvider.apple);

    return SignInWithAppleButton(
      text: state.isLoading && !state.hasError
          ? 'Logging in...'
          : 'Sign in with Apple',
      onPressed: handleAppleSignIn,
      style: SignInWithAppleButtonStyle.white,
    );
  }
}
