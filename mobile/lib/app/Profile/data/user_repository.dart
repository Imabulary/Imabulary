import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/utils/api.dart';
import 'package:mobile/utils/request.dart';

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
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(dio: getDioClient());
});
