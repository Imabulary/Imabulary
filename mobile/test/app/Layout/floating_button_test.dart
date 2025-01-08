import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/app/Layout/widgets/AddBottomSheet/add_bottom_sheet.dart';
import 'package:mobile/app/Layout/widgets/FloatingButton/floating_button.dart';

import '../../test_utils/test_app.dart';

void main() {
  group('FloatingButton', () {
    testWidgets(
      'should render floating fab and open bottom sheet when clicked',
      (tester) async {
        await tester.pumpWidget(const ProviderScope(
          child: TestApp(
            FloatingButton(),
          ),
        ));

        final addIcon = find.byIcon(Icons.add);
        final floatingButton = find.byType(FloatingActionButton);

        expect(addIcon, findsOneWidget);
        expect(floatingButton, findsOneWidget);

        await tester.tap(floatingButton);

        await tester.pump();

        final addBottomSheet = find.byType(AddBottomSheet);

        expect(addBottomSheet, findsOneWidget);
      },
    );
  });
}
