import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/app/Profile/data/dto/profile_dto.dart';
import 'package:mobile/app/Profile/domain/profile.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository({required this.client, required this.dio});

  final FirebaseAuth client;
  final Dio dio;

  Stream<User?> get authStateChange => client.idTokenChanges();

  Future<ProfileDTO> loginWithGoogle() {
    return request(() async {
      final googleAuthProvider = GoogleAuthProvider();

      final token = await client.signInWithProvider(googleAuthProvider);
      final user = token.user;

      if (user == null) {
        throw const ServerError(
          statusCode: 401,
          message:
              "Unexpected error happened during logging you into system. Don't worry, we're on it! Try again later.",
        );
      }

      return ProfileDTO(uid: user.uid, email: user.email!);
    });
  }

  Future createUser(ProfileDTO profile) {
    return request(() async {
      final url = '${dotenv.env['API_URL']}/users';

      final response = await dio.post(url, data: profile.toJson());

      return Profile.fromJson(response.data);
    });
  }

  Future signOut() {
    return request(() async {
      await client.signOut();
    });
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(client: FirebaseAuth.instance, dio: Dio());
