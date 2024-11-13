import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Feedback/presentation/feedback_screen.dart';
import 'package:mobile/app/Flashcard/domain/scanPhotoPayload/scan_photo_payload.dart';
import 'package:mobile/app/Flashcard/presentation/flashcard_screen.dart';
import 'package:mobile/app/Home/presentation/home.dart';
import 'package:mobile/app/ObjectsOnImage/domain/ObjectOnImage/object_on_image.dart';
import 'package:mobile/app/ObjectsOnImage/presentation/objects_on_image_screen.dart';
import 'package:mobile/app/Profile/presentation/profile_screen.dart';
import 'package:mobile/app/Quiz/domain/result.dart';
import 'package:mobile/app/Quiz/presentation/QuizScreen/quiz_screen.dart';
import 'package:mobile/app/Quiz/presentation/result_screen.dart';
import 'package:mobile/app/Set/presentation/set_screen.dart';
import 'package:mobile/app/Wallet/presentation/wallet_screen.dart';
import 'package:mobile/app/Welcome/presentation/welcome_screen.dart';
import 'package:mobile/app/Main/presentation/main_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter({super.navigatorKey, required this.user});

  final User? user;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (user != null || resolver.route.name == WelcomeRoute.name) {
      resolver.next(true);
    } else {
      resolver.redirect(const WelcomeRoute());
    }
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: FlashcardRoute.page),
        AutoRoute(page: WalletRoute.page),
        AutoRoute(page: FeedbackRoute.page),
        AutoRoute(page: SetRoute.page),
        AutoRoute(page: QuizRoute.page),
        AutoRoute(page: ResultRoute.page)
      ];
}
