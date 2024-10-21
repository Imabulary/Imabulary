import 'package:dio/dio.dart';
import 'package:mobile/utils/fp.dart';
import 'package:mobile/utils/maybe.dart';

class ServerResponse<R> {
  ServerResponse({required this.result, this.totalItems});

  final R result;
  final int? totalItems;

  bool isLastPage(int fetchedItems) {
    if (totalItems == null) {
      throw Exception(
        "The 'isLastPage' method cannot be called as the 'totalItems' parameter was not provided in the class constructor.",
      );
    }

    final remainingItems = totalItems! - fetchedItems;

    return remainingItems <= 0;
  }

  // TODO: add tests
  static ServerResponse<List<T>> extract<T>(
    Response<dynamic> response,
    T Function(Map<String, dynamic> json) handler,
  ) {
    final List<dynamic> result = Maybe.fromValue(
      response.data['result'],
    ).map(identity).getOrElse([]);

    final int totalItems = Maybe.fromValue(response.data)
        .map((data) => data['meta'])
        .map((meta) => meta['pagination'])
        .map((pagination) => pagination['total'])
        .map(identity)
        .getOrElse(0);

    return ServerResponse<List<T>>(
      result: result.map((item) => handler(item)).toList(),
      totalItems: totalItems,
    );
  }
}
