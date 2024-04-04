import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/app/Profile/domain/profile.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository({required this.client, required this.dio});

  final FirebaseAuth client;
  final Dio dio;

  Stream<User?> get authStateChange => client.idTokenChanges();

  Future<UserCredential> loginWithGoogle() {
    return request(() async {
      final googleAuthProvider = GoogleAuthProvider();

      final user = await client.signInWithProvider(googleAuthProvider);

      return user;
    });
  }

  Future createUser(String uid, String email) {
    return request(() async {
      final url = '${dotenv.env['API_URL']}/users';

      final response = await dio.post(url, data: {
        'uid': uid,
        'email': email,
      });

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
