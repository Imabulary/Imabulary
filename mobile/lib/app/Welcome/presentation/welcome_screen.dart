import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/app/Welcome/components/apple_login_button.dart';
import 'package:mobile/app/Welcome/components/google_login_button.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:vector_graphics/vector_graphics.dart';

@RoutePage()
class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  "Build your long-term visual memory!",
                  variant: TextVariants.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 88,
                ),
                if (Platform.isAndroid) GoogleLoginButton(),
                if (Platform.isIOS) AppleLoginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
