import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/Home/presentation/home.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load();

  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imabulary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colors['primary'] as Color,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.sourceSans3(fontSize: 32),
          headlineLarge: GoogleFonts.sourceSans3(fontSize: 24),
          headlineMedium: GoogleFonts.sourceSans3(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: GoogleFonts.sourceSans3(fontSize: 16),
          labelLarge: GoogleFonts.sourceSans3(fontSize: 14),
          bodySmall: GoogleFonts.sourceSans3(fontSize: 12),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
