import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app_router.dart';

class WelcomeScreenFooterContoller {
  static openPrivacyPolicy(BuildContext context) => () {
        AutoRouter.of(context).push(
          WebViewRoute(
            title: 'Privacy Policy',
            url:
                'https://www.termsfeed.com/live/60e494f3-2d53-476c-b63c-5bdabd589f2d',
          ),
        );
      };

  static openTerms(BuildContext context) => () {
        AutoRouter.of(context).push(
          WebViewRoute(
            title: 'Terms and conditions',
            url:
                'https://cdn.prod.website-files.com/663dec74d369b9ac82ea80bc/66ddd7c1c5e6c9bbd189dae9_Terms%20of%20use.pdf',
          ),
        );
      };
}
