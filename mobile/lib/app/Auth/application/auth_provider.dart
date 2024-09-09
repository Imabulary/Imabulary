import 'package:Imabulary/app/Auth/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StreamProvider<User?>(
  (ref) => ref.read(authRepositoryProvider).authStateChange,
);
