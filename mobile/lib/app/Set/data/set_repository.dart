import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/app/Set/data/dto/set_dto.dart';
import 'package:mobile/app/Set/domain/set.dart';
import 'package:mobile/shared/models/Pagination/pagination.dart';
import 'package:mobile/shared/models/ServerResponse/server_response.dart';
import 'package:mobile/utils/api.dart';
import 'package:mobile/utils/fp.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_repository.g.dart';

class SetRepository {
  SetRepository({required this.client});

  final Dio client;

  String get endpoint => '${dotenv.env['API_URL']}/sets';

  Future<ServerResponse<List<Set>>> findAll(Pagination pagination) {
    return request(() async {
      final response = await client.get(endpoint, queryParameters: {
        "pagination": pagination.toJson(),
      });

      return ServerResponse.extract(response, Set.fromJson);
    });
  }

  Future<Set> create(SetDTO setDto) {
    return request(() async {
      final response = await client.post(endpoint, data: setDto.toJson());
      final set = response.data['result'];

      return Set.fromJson(set);
    });
  }

  Future<Set> update(String id, SetDTO setDto) {
    return request(() async {
      final response = await client.patch(
        '$endpoint/$id',
        data: omitNullables(setDto.toJson()),
      );
      final set = response.data['result'];

      return Set.fromJson(set);
    });
  }

  Future<Set> delete(String id) {
    return request(() async {
      final response = await client.delete('$endpoint/$id');
      final set = response.data['result'];

      return Set.fromJson(set);
    });
  }
}

@riverpod
SetRepository setRepository(SetRepositoryRef ref) =>
    SetRepository(client: getDioClient());
