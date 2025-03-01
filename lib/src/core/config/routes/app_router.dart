import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/config/routes/go_router_refresh_stream.dart';
import 'package:netflix_clone/src/core/config/routes/not_found_screen.dart';
import 'package:netflix_clone/src/core/config/routes/scaffold_with_nested_navigation.dart';
import 'package:netflix_clone/src/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:netflix_clone/src/features/authentication/presentation/blocs/auth/authentication_bloc.dart';
import 'package:netflix_clone/src/features/authentication/presentation/pages/login/login_screen.dart';
import 'package:netflix_clone/src/features/authentication/presentation/pages/profile_management/profile_management_screen.dart';
import 'package:netflix_clone/src/features/authentication/presentation/pages/profile_selection/profile_selection_screen.dart';
import 'package:netflix_clone/src/features/games/presentation/pages/game_screen.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/presentation/pages/home/home_screen.dart';
import 'package:netflix_clone/src/features/movies/presentation/pages/movie_detail_screen.dart';
import 'package:netflix_clone/src/features/movies/presentation/pages/new_and_hot_screen.dart';
import 'package:netflix_clone/src/features/splash/presentation/pages/splash_screen.dart';

/// All the supported routes in the app.
/// By using an enum, we route by name using this syntax:
/// ```dart
/// context.goNamed(AppRoute.orders.name)
/// ```

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _gamesNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'entries');
final _newAndHotNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'account');
final _accountNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'account');

enum AppRoute {
  splash,
  login,
  profileSelection,
  home,
  games,
  newAndHot,
  profileManagement,
  movieDetail,
  search,
}

GoRouter goRouter(BuildContext context) {
  return GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    // * redirect logic based on the authentication state
    redirect: (context, state) async {
      final authState = context.read<AuthenticationBloc>().state;
      final path = state.uri.path;
      if (path == '/splash' &&
          authState.status == AuthenticationStatus.unknown) {
        return null;
      }
      if (authState.status == AuthenticationStatus.unauthenticated) {
        return '/login';
      }

      if (authState.status == AuthenticationStatus.authenticated) {
        return '/profileSelection';
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(
      context.read<AuthenticationBloc>().stream,
    ),
    routes: [
      GoRoute(
        path: '/splash',
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/profileSelection',
        name: AppRoute.profileSelection.name,
        builder: (context, state) => const ProfileSelectionScreen(),
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => NoTransitionPage(
          child: ScaffoldWithNestedNavigation(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                name: AppRoute.home.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: AppRoute.movieDetail.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      final id = state.pathParameters['id']!;
                      final heroTag = 'movie_$id';
                      final movieDetail = state.extra as MovieDetailEntity?;
                      return MaterialPage(
                        fullscreenDialog: true,
                        child: MovieDetailScreen(
                          heroTag: heroTag,
                          movieDetail: movieDetail,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _gamesNavigatorKey,
            routes: [
              GoRoute(
                path: '/games',
                name: AppRoute.games.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: GamesScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _newAndHotNavigatorKey,
            routes: [
              GoRoute(
                path: '/newAndHot',
                name: AppRoute.newAndHot.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: NewAndHotScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _accountNavigatorKey,
            routes: [
              GoRoute(
                path: '/account',
                name: AppRoute.profileManagement.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfileManagementScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],

    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
