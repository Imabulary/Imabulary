import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/app/Welcome/components/anonymus_login_button.dart';
import 'package:mobile/app/Welcome/components/apple_login_button.dart';
import 'package:mobile/app/Welcome/components/google_login_button.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button.dart';
import 'package:vector_graphics/vector_graphics.dart';

@RoutePage()
class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  void openPrivacyPolicy(BuildContext context) {
    AutoRouter.of(context).push(
      WebViewRoute(
        title: 'Privacy Policy',
        url:
            'https://www.termsfeed.com/live/60e494f3-2d53-476c-b63c-5bdabd589f2d',
      ),
    );
  }

  void openTerms(BuildContext context) {
    AutoRouter.of(context).push(
      WebViewRoute(
        title: 'Terms and conditions',
        url:
            'https://cdn.prod.website-files.com/663dec74d369b9ac82ea80bc/66ddd7c1c5e6c9bbd189dae9_Terms%20of%20use.pdf',
      ),
    );
  }

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
                const Spacer(),
                if (Platform.isAndroid) const GoogleLoginButton(),
                if (Platform.isIOS) const AppleLoginButton(),
                const Row(children: [
                  Expanded(
                    child: Divider(
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("OR"),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(child: Divider()),
                ]),
                const AnonymusLoginButton(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      onPressed: () => openPrivacyPolicy(context),
                      label: 'Privacy Policy',
                      variat: ButtonVariant.text,
                    ),
                    Button(
                      onPressed: () => openTerms(context),
                      label: 'Terms and conditions',
                      variat: ButtonVariant.text,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
