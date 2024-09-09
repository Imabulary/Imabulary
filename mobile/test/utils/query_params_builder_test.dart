import 'package:flutter_test/flutter_test.dart';
import 'package:Imabulary/shared/models/Pagination/pagination.dart';
import 'package:Imabulary/utils/query_params_builder.dart';
import 'package:faker/faker.dart';

void main() {
  group('QueryParamsManager', () {
    group('buildFlashcardsInSetQueryParams', () {
      test(
        'should build query params object with pagination only if setId was not provided',
        () {
          final result = QueryParamsManager().buildFlashcardsInSetQueryParams(
            const Pagination(),
          );

          expect(
            result,
            equals({
              "pagination": {"page": 1, 'limit': 10}
            }),
          );
        },
      );

      test(
        'should build query params object with pagination and filters if setId was provided',
        () {
          final faker = Faker();
          final setId = faker.guid.guid();

          final result = QueryParamsManager().buildFlashcardsInSetQueryParams(
            const Pagination(),
            setId: setId,
          );

          expect(
            result,
            equals({
              "pagination": {"page": 1, 'limit': 10},
              "filters": {
                "CardsOnSets": {
                  "some": {"setId": setId}
                }
              }
            }),
          );
        },
      );
    });
  });
}
