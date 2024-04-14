// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FlashCardRoute.name: (routeData) {
      final args = routeData.argsAs<FlashCardRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FlashCardScreen(
          key: args.key,
          flashCard: args.flashCard,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileScreen(
          key: args.key,
          initialTabIndex: args.initialTabIndex,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [FlashCardScreen]
class FlashCardRoute extends PageRouteInfo<FlashCardRouteArgs> {
  FlashCardRoute({
    Key? key,
    required FlashCard flashCard,
    List<PageRouteInfo>? children,
  }) : super(
          FlashCardRoute.name,
          args: FlashCardRouteArgs(
            key: key,
            flashCard: flashCard,
          ),
          initialChildren: children,
        );

  static const String name = 'FlashCardRoute';

  static const PageInfo<FlashCardRouteArgs> page =
      PageInfo<FlashCardRouteArgs>(name);
}

class FlashCardRouteArgs {
  const FlashCardRouteArgs({
    this.key,
    required this.flashCard,
  });

  final Key? key;

  final FlashCard flashCard;

  @override
  String toString() {
    return 'FlashCardRouteArgs{key: $key, flashCard: $flashCard}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    int initialTabIndex = 0,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            initialTabIndex: initialTabIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.initialTabIndex = 0,
  });

  final Key? key;

  final int initialTabIndex;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, initialTabIndex: $initialTabIndex}';
  }
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
