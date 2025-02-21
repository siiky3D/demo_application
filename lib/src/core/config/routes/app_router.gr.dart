// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:demo_app_temp/src/features/authentication/presentation/pages/login/login_screen.dart'
    as _i3;
import 'package:demo_app_temp/src/features/authentication/presentation/pages/profile_management/profile_management_screen.dart'
    as _i7;
import 'package:demo_app_temp/src/features/authentication/presentation/pages/profile_selection/profile_selection_screen.dart'
    as _i8;
import 'package:demo_app_temp/src/features/games/presentation/pages/game_screen.dart'
    as _i1;
import 'package:demo_app_temp/src/features/main/presentation/home/home_screen.dart'
    as _i2;
import 'package:demo_app_temp/src/features/main/presentation/main/main_screen.dart'
    as _i4;
import 'package:demo_app_temp/src/features/movies/presentation/pages/movies_listing_screen.dart'
    as _i5;
import 'package:demo_app_temp/src/features/movies/presentation/pages/new_and_hot_screen.dart'
    as _i6;
import 'package:demo_app_temp/src/features/splash/presentation/pages/splash_screen.dart'
    as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    GamesRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.GamesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainScreen(),
      );
    },
    MoviesListingRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MoviesListingScreen(),
      );
    },
    NewAndHotRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.NewAndHotScreen(),
      );
    },
    ProfileManagementRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfileManagementScreen(),
      );
    },
    ProfileSelectionRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileSelectionScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.GamesScreen]
class GamesRoute extends _i10.PageRouteInfo<void> {
  const GamesRoute({List<_i10.PageRouteInfo>? children})
      : super(
          GamesRoute.name,
          initialChildren: children,
        );

  static const String name = 'GamesRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainScreen]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MoviesListingScreen]
class MoviesListingRoute extends _i10.PageRouteInfo<void> {
  const MoviesListingRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MoviesListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoviesListingRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.NewAndHotScreen]
class NewAndHotRoute extends _i10.PageRouteInfo<void> {
  const NewAndHotRoute({List<_i10.PageRouteInfo>? children})
      : super(
          NewAndHotRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewAndHotRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProfileManagementScreen]
class ProfileManagementRoute extends _i10.PageRouteInfo<void> {
  const ProfileManagementRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileManagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileManagementRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfileSelectionScreen]
class ProfileSelectionRoute extends _i10.PageRouteInfo<void> {
  const ProfileSelectionRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileSelectionRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
