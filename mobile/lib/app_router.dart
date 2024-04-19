import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/Flashcard/domain/card.dart';
import 'package:mobile/app/Flashcard/presentation/flashcard.dart';
import 'package:mobile/app/Home/presentation/home.dart';
import 'package:mobile/app/Profile/presentation/profile.dart';
import 'package:mobile/app/Welcome/presentation/welcome_screen.dart';

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
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: FlashcardRoute.page)
      ];
}
