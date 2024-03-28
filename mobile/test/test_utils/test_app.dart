import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  const TestApp(this.home, {super.key, this.isScaffolded});

  final Widget home;
  final bool? isScaffolded;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      home: isScaffolded != null ? Scaffold(body: home) : home,
    );
  }
}
