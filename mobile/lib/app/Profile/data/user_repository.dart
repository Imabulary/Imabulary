import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Profile/data/dto/profile_dto.dart';
import 'package:mobile/app/Profile/domain/profile.dart';
import 'package:mobile/utils/api.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

class UserRepository {
  final Dio dio;

  String get endpoint => '${dotenv.env['API_URL']}/users';

  UserRepository({required this.dio});

  Future<bool> deleteUser() {
    return request(() async {
      final response = await dio.delete(endpoint);

      return response.data['result'];
    });
  }

  Future<Profile> update(UpdateUserDTO updateUserDto) {
    return request(() async {
      final response = await dio.patch(endpoint, data: updateUserDto);

      return response.data['result'];
    });
  }
}

@riverpod
UserRepository userRepository(Ref ref) => UserRepository(dio: getDioClient());
