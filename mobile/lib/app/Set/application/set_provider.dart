import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Set/data/set_repository.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';

final findAllSetsProvider = FutureProvider.autoDispose.family(
  (ref, Pagination pagination) =>
      ref.watch(setRepositoryProvider).findAll(pagination),
);
