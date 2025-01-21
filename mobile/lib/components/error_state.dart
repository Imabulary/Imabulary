import 'package:flutter/widgets.dart';
import 'package:mobile/atoms/type_setting.dart';
import 'package:mobile/components/button/button.dart';
import 'package:mobile/shared/models/ServerError/server_error.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    required this.error,
    required this.title,
    required this.onRefresh,
  });

  final Object error;
  final String title;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TypeSetting(
          title,
          variant: TextVariants.headlineLarge,
        ),
        const SizedBox(
          height: 24,
        ),
        TypeSetting(
          error is ServerError
              ? (error as ServerError).message
              : ServerError.defaultError,
        ),
        const SizedBox(
          height: 24,
        ),
        Button(
          onPressed: onRefresh,
          label: 'Retry',
          expanded: true,
        )
      ],
    );
  }
}
