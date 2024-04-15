import 'package:flutter/material.dart';
import 'package:mobile/app/Layout/presentation/layout.dart';
import 'package:mobile/app/Set/widgets/SetAppBar/set_app_bar.dart';

class SetScreen extends StatelessWidget {
  const SetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      Placeholder(),
      appBar: SetAppBar(),
    );
  }
}
