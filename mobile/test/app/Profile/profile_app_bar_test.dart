import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/Auth/data/auth_repository.dart';
import 'package:mobile/app/Profile/widgets/ProfileAppBar/profile_app_bar.dart';
import 'package:mobile/app/Profile/widgets/ProfileAppBar/profile_app_bar_controller.dart';
import 'package:mobile/app/Profile/widgets/settings_list.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_utils/mocks.dart';
import '../../test_utils/test_app.dart';

class MockProfileAppBarController extends Mock
    implements ProfileAppBarController {}

class MockTabController extends Mock implements TabController {}

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  final mockedAuthRepository = MockAuthRepository();
  final mockedTabController = MockTabController();

  pumpProfileAppBar(WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWithValue(mockedAuthRepository)
      ],
      child: TestApp(
        Scaffold(
          appBar: ProfileAppBar(mockedTabController),
        ),
      ),
    ));
  }

  group('ProfileAppBar', () {
    testWidgets(
      'should render profile app bar with predefined profile photo',
      (tester) async {
        when(() => mockedAuthRepository.authStateChange).thenAnswer(
          (_) => Stream.value(null),
        );

        await pumpProfileAppBar(tester);

        final circleAvatar = find.byType(CircleAvatar);
        final defaultProfilePicture = tester.widget(
          circleAvatar,
        ) as CircleAvatar;

        expect(circleAvatar, findsOneWidget);
        expect(defaultProfilePicture.backgroundImage, isA<AssetImage>());
      },
    );

    testWidgets(
      'should render bottom sheet with settings when clicked',
      (tester) async {
        await pumpProfileAppBar(tester);

        final circleAvatar = find.byType(CircleAvatar);

        await tester.tap(circleAvatar);

        await tester.pump();

        final settingsList = find.byType(SettingsList);

        expect(settingsList, findsOneWidget);
      },
    );
  });
}
