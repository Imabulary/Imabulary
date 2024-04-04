import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/Profile/data/dto/profile_dto.dart';
import 'package:mobile/app/Auth/data/auth_repository.dart';
import 'package:mobile/app/Welcome/presentation/welcome_screen.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_utils/mocks.dart';
import '../../test_utils/test_app.dart';

void main() {
  group('Welcome Screen', () {
    testWidgets('should be rendered correctly', (tester) async {
      await tester.pumpWidget(const TestApp(ProviderScope(
        child: WelcomeScreen(),
      )));

      final svgSprite = find.byType(SvgPicture);
      final welcomeMessage = find.text('Welcome to Imabulary');
      final slogan = find.text("You're the one we've been waiting for!");
      final googleLoginButton = find.text("Sign in with Google");

      expect(svgSprite, findsOneWidget);
      expect(welcomeMessage, findsWidgets);
      expect(slogan, findsWidgets);
      expect(googleLoginButton, findsWidgets);
    });

    testWidgets(
      'Sign in with Google button should be in loading state when being clicked',
      (tester) async {
        final mockedAuthReposiory = MockAuthRepository();

        await tester.pumpWidget(TestApp(ProviderScope(
          overrides: [
            authRepositoryProvider.overrideWithValue(mockedAuthReposiory),
          ],
          child: const WelcomeScreen(),
        )));

        const profileDto = ProfileDTO(uid: '123', email: 'email@test.com');

        when(
          () => mockedAuthReposiory.loginWithGoogle(),
        ).thenAnswer((_) async => profileDto);

        when(
          () => mockedAuthReposiory.createUser(profileDto),
        ).thenAnswer((_) async {
          await Future.delayed(const Duration(microseconds: 1000));

          print('User was logged in with Google!');
        });

        final googleLoginButton = find.byKey(const Key('google-login'));

        await tester.tap(googleLoginButton);

        await tester.pump();

        final googleLoginButtonInLoadingState = find.text('Logging in...');

        expect(googleLoginButtonInLoadingState, findsWidgets);

        await tester.pumpAndSettle();
      },
    );
  });
}
