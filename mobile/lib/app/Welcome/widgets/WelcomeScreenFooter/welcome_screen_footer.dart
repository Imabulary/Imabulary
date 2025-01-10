import 'package:flutter/material.dart';
import 'package:mobile/app/Welcome/widgets/WelcomeScreenFooter/welcome_screen_footer_contoller.dart';
import 'package:mobile/components/button/button.dart';

class WelcomeScreenFooter extends StatelessWidget {
  const WelcomeScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Button(
          onPressed: WelcomeScreenFooterContoller.openPrivacyPolicy(context),
          label: 'Privacy Policy',
          variant: ButtonVariant.text,
        ),
        Button(
          onPressed: WelcomeScreenFooterContoller.openTerms(context),
          label: 'Terms and conditions',
          variant: ButtonVariant.text,
        ),
      ],
    );
  }
}
