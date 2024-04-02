import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final FirebaseAuth client;

  Stream<User?> get authStateChange => client.idTokenChanges();

  Future loginWithGoogle() {
    return request(() async {
      final googleAuthProvider = GoogleAuthProvider();

      await client.signInWithProvider(googleAuthProvider);
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
    AuthRepository(client: FirebaseAuth.instance);
