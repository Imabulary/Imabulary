import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/app/Welcome/presentation/welcome_screen_controller.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:vector_graphics/vector_graphics.dart';

@RoutePage()
class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                const TypeSetting(
                  "We've been waiting for you!",
                  variant: TextVariants.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 88,
                ),
                ElevatedButton(
                  onPressed: handleGoogleSignIn,
                  child: state.isLoading
                      ? const TypeSetting('Logging in...')
                      : const TypeSetting('Sign in with Google'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
