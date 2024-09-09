import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:Imabulary/app/Profile/widgets/settings_list.dart';
import 'package:Imabulary/app/Auth/data/auth_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_utils/mocks.dart';
import '../../test_utils/test_app.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('SettingsList', () {
    testWidgets('should render profile settings list', (tester) async {
      final authRepository = MockAuthRepository();

      await tester.pumpWidget(TestApp(
        ProviderScope(
          overrides: [authRepositoryProvider.overrideWithValue(authRepository)],
          child: const SettingsList(),
        ),
        isScaffolded: true,
      ));

      when(() => authRepository.signOut()).thenAnswer((_) async {
        print('User was signed out');
      });

      final logoutListItem = find.text('Log out');
      final logoutListItemKey = find.byKey(const Key('logout'));

      expect(logoutListItem, findsWidgets);

      await tester.tap(logoutListItemKey);

      await tester.pumpAndSettle();

      verify(() => authRepository.signOut()).called(1);
    });
  });
}
