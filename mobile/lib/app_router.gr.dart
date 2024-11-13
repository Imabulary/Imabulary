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
    FeedbackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeedbackScreen(),
      );
    },
    FlashcardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FlashcardScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    ObjectsOnImageRoute.name: (routeData) {
      final args = routeData.argsAs<ObjectsOnImageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ObjectsOnImageScreen(
          key: args.key,
          objectsOnImage: args.objectsOnImage,
          scanPhotoPayload: args.scanPhotoPayload,
        ),
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
    QuizRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuizScreen(),
      );
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResultScreen(
          key: args.key,
          results: args.results,
        ),
      );
    },
    SetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetScreen(),
      );
    },
    WalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WalletScreen(),
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
/// [FeedbackScreen]
class FeedbackRoute extends PageRouteInfo<void> {
  const FeedbackRoute({List<PageRouteInfo>? children})
      : super(
          FeedbackRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedbackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FlashcardScreen]
class FlashcardRoute extends PageRouteInfo<void> {
  const FlashcardRoute({List<PageRouteInfo>? children})
      : super(
          FlashcardRoute.name,
          initialChildren: children,
        );

  static const String name = 'FlashcardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ObjectsOnImageScreen]
class ObjectsOnImageRoute extends PageRouteInfo<ObjectsOnImageRouteArgs> {
  ObjectsOnImageRoute({
    Key? key,
    required List<ObjectOnImage> objectsOnImage,
    required ScanPhotoPayload scanPhotoPayload,
    List<PageRouteInfo>? children,
  }) : super(
          ObjectsOnImageRoute.name,
          args: ObjectsOnImageRouteArgs(
            key: key,
            objectsOnImage: objectsOnImage,
            scanPhotoPayload: scanPhotoPayload,
          ),
          initialChildren: children,
        );

  static const String name = 'ObjectsOnImageRoute';

  static const PageInfo<ObjectsOnImageRouteArgs> page =
      PageInfo<ObjectsOnImageRouteArgs>(name);
}

class ObjectsOnImageRouteArgs {
  const ObjectsOnImageRouteArgs({
    this.key,
    required this.objectsOnImage,
    required this.scanPhotoPayload,
  });

  final Key? key;

  final List<ObjectOnImage> objectsOnImage;

  final ScanPhotoPayload scanPhotoPayload;

  @override
  String toString() {
    return 'ObjectsOnImageRouteArgs{key: $key, objectsOnImage: $objectsOnImage, scanPhotoPayload: $scanPhotoPayload}';
  }
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
/// [QuizScreen]
class QuizRoute extends PageRouteInfo<void> {
  const QuizRoute({List<PageRouteInfo>? children})
      : super(
          QuizRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuizRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResultScreen]
class ResultRoute extends PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    Key? key,
    required List<Result> results,
    List<PageRouteInfo>? children,
  }) : super(
          ResultRoute.name,
          args: ResultRouteArgs(
            key: key,
            results: results,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const PageInfo<ResultRouteArgs> page = PageInfo<ResultRouteArgs>(name);
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.results,
  });

  final Key? key;

  final List<Result> results;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, results: $results}';
  }
}

/// generated route for
/// [SetScreen]
class SetRoute extends PageRouteInfo<void> {
  const SetRoute({List<PageRouteInfo>? children})
      : super(
          SetRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WalletScreen]
class WalletRoute extends PageRouteInfo<void> {
  const WalletRoute({List<PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
