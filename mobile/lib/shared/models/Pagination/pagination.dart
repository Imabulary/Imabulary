import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

/// Standard values are `page = 1` and `limit = 10`
@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @Default(1) int? page,
    @Default(100) int? limit,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
