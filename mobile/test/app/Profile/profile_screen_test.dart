import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/Profile/presentation/profile_screen.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_utils/mocks.dart';
import '../../test_utils/test_app.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  mockAuthRepository() {
    final mockedAuthRepository = MockAuthRepository();

    when(() => mockedAuthRepository.authStateChange).thenAnswer(
      (_) => Stream.value(null),
    );
  }

  pumpProfileScreen(WidgetTester tester) async {
    await tester.pumpWidget(const TestApp(ProviderScope(
      child: ProfileScreen(),
    )));
  }

  group('Profile Screen', () {
    testWidgets(
      'should render profile page with app bar and profile picture',
      (tester) async {
        mockAuthRepository();
        await pumpProfileScreen(tester);

        final circleAvatar = find.byType(CircleAvatar);
        final appBar = find.byType(AppBar);
        final defaultProfilePicture = tester.widget(
          circleAvatar,
        ) as CircleAvatar;

        expect(appBar, findsOneWidget);
        expect(circleAvatar, findsOneWidget);
        expect(defaultProfilePicture.backgroundImage, isA<AssetImage>());
      },
    );
  });
}
