import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile/app/Auth/data/auth_repository_template.dart';
import 'package:mobile/app/Auth/domain/auth.dart';
import 'package:mobile/app/Profile/data/dto/profile_dto.dart';
import 'package:mobile/utils/api.dart';
import 'package:mobile/utils/request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository({required this.firebase, required this.dio});

  final FirebaseAuth firebase;
  final Dio dio;

  Stream<User?> get authStateChange => firebase.idTokenChanges();

  Future<ProfileDTO> signIn(AppAuthProvider authProvider) {
    final authProviders = {
      AppAuthProvider.apple.name: LoginWithAppleTemplate(
        firebase: firebase,
        dio: dio,
      ),
      AppAuthProvider.google.name: LoginWithGoogleTemplate(
        firebase: firebase,
        dio: dio,
      ),
    };

    final loginTemplate = authProviders[authProvider.name];

    if (loginTemplate == null) {
      throw new Exception('Undefined auth provider has been used.');
    }

    return loginTemplate.run();
  }

  Future signOut() {
    return request(() async {
      await firebase.signOut();
    });
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(firebase: FirebaseAuth.instance, dio: getDioClient());
