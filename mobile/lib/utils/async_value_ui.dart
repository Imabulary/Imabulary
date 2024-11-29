import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/components/dialogs.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';
import 'package:mobile/utils/logger.dart';

extension AsyncValueUI on AsyncValue {
  showLoadingDialog(
    BuildContext context, {
    String message = 'Loading...',
  }) {
    if (isLoading) {
      showDialog(
        context: context,
        builder: (context) => Dialogs.loading(message),
      );
    }
  }

  void showErrorDialog(BuildContext context, bool doPop) {
    if (!isLoading && hasError && hasValue) {
      appLogger.severe(error, stackTrace);

      if (error is ServerError) {
        final ServerError exception = error as ServerError;

        if (doPop) {
          Navigator.pop(context);
        }

        showDialog(
          context: context,
          builder: (context) => Dialogs.error(exception.message),
        );
      } else {
        if (doPop) {
          Navigator.pop(context);
        }

        showDialog(
          context: context,
          builder: (context) => Dialogs.error(''),
        );
      }
    }
  }
}
