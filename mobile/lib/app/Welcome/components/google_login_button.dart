import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Auth/domain/auth.dart';
import 'package:mobile/app/Welcome/presentation/welcome_screen_controller.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/utils/async_value_ui.dart';

class GoogleLoginButton extends ConsumerWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen((welcomeScreenControllerProvider), (_, state) {
      state.showErrorDialog(context, false);
    });

    final state = ref.watch(welcomeScreenControllerProvider);

    handleGoogleSignIn() => state.isLoading
        ? null
        : ref
            .read(welcomeScreenControllerProvider.notifier)
            .login(AppAuthProvider.google);

    return Button(
      key: const Key('google-login'),
      onPressed: handleGoogleSignIn,
      label: state.isLoading && !state.hasError
          ? 'Logging in...'
          : 'Sign in with Google',
    );
  }
}
