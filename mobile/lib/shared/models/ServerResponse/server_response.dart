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
}
