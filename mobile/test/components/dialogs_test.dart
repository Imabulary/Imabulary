import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/components/dialogs.dart';

import '../test_utils/test_app.dart';

void main() {
  group('Dialogs.loading', () {
    testWidgets(
      'should render loading dialog with default message',
      (tester) async {
        await tester.pumpWidget(TestApp(Dialogs.loading(null)));

        final loadingSpinner = find.byType(CircularProgressIndicator);
        final loadingText = find.text(
          'Awesomeness is loading, wait a second...',
        );

        expect(loadingSpinner, findsOneWidget);
        expect(loadingText, findsWidgets);
      },
    );

    testWidgets(
      'should render loading dialog with provided message',
      (tester) async {
        await tester.pumpWidget(TestApp(
          Dialogs.loading('Something is being loaded...'),
        ));

        final loadingSpinner = find.byType(CircularProgressIndicator);
        final loadingText = find.text(
          'Something is being loaded...',
        );

        expect(loadingSpinner, findsOneWidget);
        expect(loadingText, findsWidgets);
      },
    );
  });

  group('Dialogs.error', () {
    testWidgets(
      'should render error dialog with default message',
      (tester) async {
        await tester.pumpWidget(TestApp(
          Dialogs.error(null),
        ));

        final errorTitle = find.text("Oops! We're sorry");
        final errorMessage = find.text(
          "Something hiccuped. Don't worry, we're on it! Try again later.",
        );

        expect(errorTitle, findsWidgets);
        expect(errorMessage, findsWidgets);
      },
    );

    testWidgets(
      'should render error dialog with provided message',
      (tester) async {
        await tester.pumpWidget(TestApp(
          Dialogs.error('Something bad happened.'),
        ));

        final errorTitle = find.text("Oops! We're sorry");
        final errorMessage = find.text(
          "Something bad happened.",
        );

        expect(errorTitle, findsWidgets);
        expect(errorMessage, findsWidgets);
      },
    );
  });
}
