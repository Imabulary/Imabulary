import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Layout/widgets/bottom_navigation.dart';
import 'package:mobile/app/Layout/widgets/floating_button.dart';

import '../../test_utils/test_app.dart';

void main() {
  group('Layout', () {
    testWidgets(
      'should render the layout with floating button, bottom navigation and the provided content',
      (tester) async {
        await tester.pumpWidget(const TestApp(Layout(Text('Hello World!'))));

        final pageContent = find.text('Hello World!');
        final bottomNavigation = find.byType(BottomNavigation);
        final floatingButton = find.byType(FloatingButton);

        expect(pageContent, findsOneWidget);
        expect(bottomNavigation, findsOneWidget);
        expect(floatingButton, findsOneWidget);
      },
    );
  });
}
