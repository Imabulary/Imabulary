import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Profile/data/user_repository.dart';
import 'package:mobile/app/Auth/data/auth_repository.dart';

final deleteDataDialogControllerProvider =
    StateNotifierProvider<DeleteDataDialogController, DeleteDataDialogState>((ref) {
  return DeleteDataDialogController(ref);
});

class DeleteDataDialogState {
  final bool isButtonEnabled;
  final AsyncValue<bool> deleteStatus;

  DeleteDataDialogState({
    required this.isButtonEnabled,
    required this.deleteStatus,
  });
}

class DeleteDataDialogController extends StateNotifier<DeleteDataDialogState> {
  DeleteDataDialogController(this.ref)
      : super(DeleteDataDialogState(
          isButtonEnabled: false,
          deleteStatus: const AsyncValue.data(false),
        )) {
    _userEmail = FirebaseAuth.instance.currentUser?.email;
  }

  final Ref ref;
  String? _userEmail;

  String? get userEmail => _userEmail;

  void checkEmailMatch(String inputEmail) {
    state = DeleteDataDialogState(
      isButtonEnabled: inputEmail == _userEmail,
      deleteStatus: state.deleteStatus,
    );
  }

  Future<void> deleteUser(BuildContext context) async {
    final userRepository = ref.read(userRepositoryProvider);
    final signOut = ref.read(authRepositoryProvider).signOut;

    state = DeleteDataDialogState(
      isButtonEnabled: state.isButtonEnabled,
      deleteStatus: const AsyncValue.loading(),
    );

    final result = await AsyncValue.guard(() async {
      final success = await userRepository.deleteUser();
      if (success) {
        await signOut();
      }
      return success;
    });

    state = DeleteDataDialogState(
      isButtonEnabled: state.isButtonEnabled,
      deleteStatus: result,
    );

    result.when(
      data: (success) {
        if (!success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to delete user.')),
          );
        }
      },
      loading: () {},
      error: (error, stack) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occurred while deleting user.')),
        );
      },
    );
  }
}
