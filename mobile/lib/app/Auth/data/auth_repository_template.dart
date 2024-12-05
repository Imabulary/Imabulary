import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/data/dto/profile_dto.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';
import 'package:mobile/utils/request.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Abstract base class for login templates
abstract class LoginTemplate {
  LoginTemplate({required this.firebase});

  final FirebaseAuth firebase;

  /// Main method to execute the login and map the user to ProfileDTO
  Future<ProfileDTO> run() {
    return request(() async {
      final user = await signIn();

      throwIfUserIsNull(user);

      return mapUser(user!);
    });
  }

  /// Abstract method for the sign-in process
  @protected
  Future<User?> signIn();

  /// Throws an error if the user is null
  @protected
  void throwIfUserIsNull(User? user) {
    if (user == null) {
      throw const ServerError(
        statusCode: 401,
        message:
            "Unexpected error happened during logging you into the system. Don't worry, we're on it! Try again later.",
      );
    }
  }

  /// Maps a Firebase User to a ProfileDTO
  @protected
  ProfileDTO mapUser(User user) {
    return ProfileDTO(uid: user.uid, email: user.email);
  }
}

/// Implementation for Google login
class LoginWithGoogleTemplate extends LoginTemplate {
  LoginWithGoogleTemplate({required super.firebase});

  @override
  Future<User?> signIn() async {
    final token = await firebase.signInWithProvider(GoogleAuthProvider());

    return token.user;
  }
}

/// Implementation for Apple login
class LoginWithAppleTemplate extends LoginTemplate {
  LoginWithAppleTemplate({required super.firebase});

  @override
  Future<User?> signIn() async {
    final credential = await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ]);

    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: credential.identityToken,
    );

    final token = await firebase.signInWithCredential(oauthCredential);

    return token.user;
  }
}

/// Implementation for Anonymous login
class LoginAnonymouslyTemplate extends LoginTemplate {
  LoginAnonymouslyTemplate({required super.firebase});

  @override
  Future<User?> signIn() async {
    final token = await firebase.signInAnonymously();

    return token.user;
  }
}
