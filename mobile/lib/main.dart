import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/Auth/application/auth_provider.dart';
import 'package:mobile/app/Flashcard/domain/scanPhotoPayload/scan_photo_payload.dart';
import 'package:mobile/app/ObjectsOnImage/domain/ObjectOnImage/object_on_image.dart';
import 'package:mobile/app/ObjectsOnImage/presentation/objects_on_image_screen.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: 'assets/.env');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Imabulary',
    //   theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(
    //         seedColor: AppColors.primary,
    //         brightness: Brightness.dark,
    //       ),
    //       textTheme: TextTheme(
    //         titleLarge: GoogleFonts.sourceSans3(fontSize: 32),
    //         headlineLarge: GoogleFonts.sourceSans3(fontSize: 24),
    //         headlineMedium: GoogleFonts.sourceSans3(
    //           fontSize: 18,
    //           fontWeight: FontWeight.bold,
    //         ),
    //         headlineMedium: GoogleFonts.sourceSans3(
    //           fontSize: 16,
    //           fontWeight: FontWeight.bold,
    //         ),
    //         bodyLarge: GoogleFonts.sourceSans3(fontSize: 16),
    //         labelLarge: GoogleFonts.sourceSans3(fontSize: 14),
    //         bodySmall: GoogleFonts.sourceSans3(fontSize: 12),
    //       ),
    //       appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    //       cardTheme: const CardTheme(color: AppColors.muted, elevation: 0),),
    //   routerConfig: AppRouter(
    //     user: ref.watch(authStateProvider).value,
    //   ).config(),
    // );
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.sourceSans3(fontSize: 32),
          headlineLarge: GoogleFonts.sourceSans3(fontSize: 24),
          headlineMedium: GoogleFonts.sourceSans3(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.sourceSans3(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: GoogleFonts.sourceSans3(fontSize: 16),
          labelLarge: GoogleFonts.sourceSans3(fontSize: 14),
          bodySmall: GoogleFonts.sourceSans3(fontSize: 12),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        cardTheme: const CardTheme(color: AppColors.muted, elevation: 0),
      ),
      home: ObjectsOnImageScreen(
        objectsOnImage: [
          ObjectOnImage(name: 'Hello', score: 0.95, translatedName: 'Привіт')
        ],
        scanPhotoPayload: ScanPhotoPayload(
          objectsOnImage: [],
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/imabulary-fc20f.appspot.com/o/image%2Fcd53b72f-b098-4b98-b751-99c03c9cbcdb_1728561451882-scaled_1000000022.jpg?alt=media&token=2d954ed1-0423-48e8-aae9-c6bc7fbeb9e4',
          imageName:
              'cd53b72f-b098-4b98-b751-99c03c9cbcdb_1728561451882-scaled_1000000022.jpg',
        ),
      ),
    );
  }
}
