import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/app/Welcome/data/auth_repository.dart';

final authStateProvider = StreamProvider<User?>(
  (ref) => ref.read(authRepositoryProvider).authStateChange,
);
