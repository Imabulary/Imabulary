import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/utils/plularize.dart';

void main() {
  group('pluralize', () {
    test('should return singular form with count 1', () {
      expect(pluralize('apple', 1), '1 apple');
      expect(pluralize('berry', 1), '1 berry');
    });

    test('should return plural form with count other than 1', () {
      expect(pluralize('apple', 2), '2 apples');
      expect(pluralize('apple', 1.5), '1.50 apples');
      expect(pluralize('apple', 2.01), '2.01 apples');
    });

    test('should handle zero count correctly', () {
      expect(pluralize('apple', 0), '0 apples');
      expect(pluralize('apple', null), '0 apples');
    });

    test('should handle words ending in y preceded by a consonant', () {
      expect(pluralize('berry', 2), '2 berries');
      expect(pluralize('berry', 2.5), '2.50 berries');
      expect(pluralize('berry', 2.01), '2.01 berries');
    });

    test('should not change words ending in y preceded by a vowel', () {
      expect(pluralize('day', 2), '2 days');
      expect(pluralize('day', 2.5), '2.50 days');
    });

    test('should remove .00 from the count', () {
      expect(pluralize('apple', 2.00), '2 apples');
      expect(pluralize('apple', 0.00), '0 apples');
    });
  });
}
