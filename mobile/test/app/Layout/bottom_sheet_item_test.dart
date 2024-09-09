import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Imabulary/app/Layout/components/bottom_sheet_item.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_utils/test_app.dart';

class MockScanPhoto extends Mock {
  void call(source);
}

void main() {
  group('BottomSheetItem', () {
    final mockScanPhoto = MockScanPhoto();

    testWidgets(
      'should render the item with icon, title and photo scan handler',
      (tester) async {
        const title = 'Item #1';
        const icon = Icons.abc;

        await tester.pumpWidget(
          TestApp(
            ListView(
              children: [
                BottomSheetItem(
                  title: title,
                  icon: icon,
                  source: ImageSource.gallery,
                  scanPhoto: mockScanPhoto,
                )
              ],
            ),
            isScaffolded: true,
          ),
        );

        final titleElement = find.text(title);
        final iconElement = find.byIcon(icon);

        expect(titleElement, findsWidgets);
        expect(iconElement, findsOneWidget);
      },
    );
  });
}
