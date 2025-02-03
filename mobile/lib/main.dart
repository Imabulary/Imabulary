import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/app/Auth/application/auth_provider.dart';
import 'package:mobile/app_router.dart';
import 'package:mobile/atoms/colors.dart';
import 'package:mobile/firebase_options.dart';
import 'package:mobile/utils/analytics_engine.dart';
import 'package:mobile/utils/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future main() async {
  AppLogging();

  await Sentry.init((options) {
    options.dsn =
        'https://5ba03443cfca54611ce1d9be35d34fcb@o4508365012598784.ingest.de.sentry.io/4508365826424912';
    options.tracesSampleRate = 1.0;
    options.environment = kReleaseMode ? 'release' : 'debug';
  }, appRunner: () async {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: 'assets/.env');

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

    runApp(const ProviderScope(child: App()));
  });
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Imabulary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.sourceSans3(fontSize: 32),
          headlineLarge: GoogleFonts.sourceSans3(
              fontSize: 24, fontWeight: FontWeight.w700),
          headlineMedium: GoogleFonts.sourceSans3(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: GoogleFonts.sourceSans3(
              fontSize: 16, fontWeight: FontWeight.w700),
          bodyLarge: GoogleFonts.sourceSans3(fontSize: 16),
          labelLarge: GoogleFonts.sourceSans3(
              fontSize: 14, fontWeight: FontWeight.w600),
          bodySmall: GoogleFonts.sourceSans3(fontSize: 12),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        cardTheme: const CardTheme(color: AppColors.muted, elevation: 0),
      ),
      routerConfig: AppRouter(
        user: ref.watch(authStateProvider).value,
      ).config(
        navigatorObservers: () => [
          FirebaseAnalyticsObserver(analytics: analyticsEngine.analytics),
        ],
      ),
    );
  }
}
