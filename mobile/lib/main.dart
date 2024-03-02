import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imabulary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(255, 240, 6, 1),
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Text(
            'Welcome to Imabulary!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontFamily: GoogleFonts.sourceSans3().fontFamily,
                ),
          ),
        ),
      ),
    );
  }
}
