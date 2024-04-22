import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/app/Welcome/presentation/welcome_screen_controller.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/utils/async_value_ui.dart';
import 'package:vector_graphics/vector_graphics.dart';

@RoutePage()
class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: add tests verifying whether the dialog is showed in case of an error
    ref.listen((welcomeScreenControllerProvider), (_, state) {
      state.showErrorDialog(context, false);
    });

    final state = ref.watch(welcomeScreenControllerProvider);

    final handleGoogleSignIn = state.isLoading
        ? null
        : ref.read(welcomeScreenControllerProvider.notifier).loginWithGoogle;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SvgPicture(
                  AssetBytesLoader('assets/images/welcome.svg.vec'),
                  width: 200,
                ),
                const SizedBox(
                  height: 36,
                ),
                const TypeSetting(
                  'Welcome to Imabulary',
                  variant: TextVariants.titleLarge,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                const TypeSetting(
                  "You're the one we've been waiting for!",
                  variant: TextVariants.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 88,
                ),
                ElevatedButton(
                  key: const Key('google-login'),
                  onPressed: handleGoogleSignIn,
                  child: state.isLoading && !state.hasError
                      ? const TypeSetting(
                          'Logging in...',
                          color: 'primary',
                        )
                      : const TypeSetting(
                          'Sign in with Google',
                          color: 'primary',
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
