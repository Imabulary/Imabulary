import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';

import '../../test_utils/test_app.dart';

void main() {
  group('BottomNavigation', () {
    testWidgets(
      'should render bottom navigation with home and profile links',
      (tester) async {
        await tester.pumpWidget(const TestApp(BottomNavigation(
          screens: [
            Scaffold(
              body: Text('Another page'),
            )
          ],
        )));

        final homeText = find.text('Home');
        final homeIcon = find.byIcon(Icons.home);
        final profileText = find.text('Profile');
        final profileIcon = find.byIcon(Icons.account_circle);

        expect(homeText, findsOneWidget);
        expect(homeIcon, findsOneWidget);
        expect(profileText, findsOneWidget);
        expect(profileIcon, findsOneWidget);

        await tester.tap(homeText);

        await tester.pumpAndSettle();

        final anotherPage = find.text('Another page');

        expect(anotherPage, findsOneWidget);
      },
    );
  });
}
