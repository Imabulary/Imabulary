import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/components/dialogs.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';

extension AsyncValueUI on AsyncValue {
  showLoadingDialog(BuildContext context) {
    if (isLoading) {
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => Dialogs.loading('Your image is being processed'),
      );
    }
  }

  showErrorDialog(BuildContext context) {
    if (!isLoading && hasError && hasValue) {
      final exception = error as ServerError;

      Navigator.pop(context);

      showDialog(
        context: context,
        builder: (context) => Dialogs.error(exception.message),
      );
    }
  }
}
