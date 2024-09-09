import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:Imabulary/app/Profile/data/dto/profile_dto.dart';
import 'package:Imabulary/app/Profile/domain/profile.dart';
import 'package:Imabulary/shared/models/ServerError/server_error.dart';
import 'package:Imabulary/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository({required this.firebase, required this.dio});

  final FirebaseAuth firebase;
  final Dio dio;

  Stream<User?> get authStateChange => firebase.idTokenChanges();

  // TODO: Add tests
  Future<ProfileDTO> loginWithGoogle() {
    return request(() async {
      final googleAuthProvider = GoogleAuthProvider();

      final token = await firebase.signInWithProvider(googleAuthProvider);
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

  createUser(ProfileDTO profile) {
    return request(() async {
      final url = '${dotenv.env['API_URL']}/users';

      final response = await dio.post(url, data: profile.toJson());

      return Profile.fromJson(response.data!['result']);
    });
  }

  Future signOut() {
    return request(() async {
      await firebase.signOut();
    });
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(firebase: FirebaseAuth.instance, dio: Dio());
