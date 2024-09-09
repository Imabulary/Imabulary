import 'package:Imabulary/shared/models/Pagination/pagination.dart';

class QueryParamsBuilder {
  final Map<String, dynamic> _queryParams = {};

  QueryParamsBuilder addPagination(Pagination pagination) {
    _queryParams['pagination'] = pagination.toJson();

    return this;
  }

  QueryParamsBuilder addFilters(Map<String, dynamic> filters) {
    _queryParams['filters'] = filters;

    return this;
  }

  Map<String, dynamic> build() {
    return _queryParams;
  }
}

class QueryParamsManager {
  Map<String, dynamic> buildFlashcardsInSetQueryParams(
    Pagination pagination, {
    String? setId,
  }) {
    final queryParamsBuilder = QueryParamsBuilder();

    if (setId == null) {
      return queryParamsBuilder.addPagination(pagination).build();
    }

    return queryParamsBuilder.addPagination(pagination).addFilters({
      "CardsOnSets": {
        "some": {"setId": setId}
      }
    }).build();
  }
}
