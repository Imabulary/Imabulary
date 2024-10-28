import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/data/user_repository.dart';
import 'package:mobile/app/Auth/data/auth_repository.dart';

final deleteDataDialogControllerProvider =
    StateNotifierProvider<DeleteDataDialogController, bool>((ref) {
  return DeleteDataDialogController(ref);
});

class DeleteDataDialogController extends StateNotifier<bool> {
  DeleteDataDialogController(this.ref) : super(false) {
    _userEmail = FirebaseAuth.instance.currentUser?.email;
  }

  final Ref ref;
  String? _userEmail;

  String? get userEmail => _userEmail;

  void checkEmailMatch(String inputEmail) {
    state = (inputEmail == _userEmail);
  }

  Future<void> deleteUser(BuildContext context) async {
    final userRepository = ref.read(userRepositoryProvider);
    final signOut = ref.read(authRepositoryProvider).signOut;

    final result = await userRepository.deleteUser();

    if (result) {
      signOut();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to delete user.'),
        ),
      );
    }
  }
}
