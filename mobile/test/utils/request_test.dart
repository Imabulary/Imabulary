import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:Imabulary/shared/models/ServerError/server_error.dart';
import 'package:Imabulary/utils/request.dart';

void main() {
  group('request', () {
    test('it should return the result of provided function', () async {
      const fixture = {"name": "Lorem Ipsum"};

      final result = await request(() {
        return Future.value(fixture);
      });

      expect(result, fixture);
    });

    test(
      'it should throw a ServerError with a error data that came from the server',
      () async {
        const apiUrl = 'https://api.com';

        final dio = Dio();
        final dioAdapter = DioAdapter(dio: dio);

        dioAdapter.onGet(
          apiUrl,
          (server) => server.reply(401, {
            "statusCode": 401,
            "message": "You don't have a permission to perform this operation",
            "error": "Unauthorized"
          }),
        );

        expect(
          request(() async {
            final result = await dio.get(apiUrl);

            return result;
          }),
          throwsA(
            const ServerError(
              statusCode: 401,
              message: "You don't have a permission to perform this operation",
              error: 'Unauthorized',
            ),
          ),
        );
      },
    );

    test(
      'it should throw a ServerError with default data if some unexpected error happened',
      () async {
        expect(
          request(() {
            throw Exception('Error in code.');
          }),
          throwsA(
            const ServerError(
              statusCode: 500,
              message: ServerError.defaultError,
            ),
          ),
        );
      },
    );
  });
}
