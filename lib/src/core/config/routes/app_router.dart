import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/config/routes/go_router_refresh_stream.dart';
import 'package:netflix_clone/src/core/config/routes/not_found_screen.dart';
import 'package:netflix_clone/src/core/config/routes/scaffold_with_nested_navigation.dart';
import 'package:netflix_clone/src/domain/entities/movie/movie_detail_entity.dart';
import 'package:netflix_clone/src/domain/repositories/auth/authentication_repository.dart';
import 'package:netflix_clone/src/presenter/blocs/auth/authentication_bloc.dart';
import 'package:netflix_clone/src/presenter/blocs/auth/profiles_bloc.dart';
import 'package:netflix_clone/src/presenter/blocs/onboarding/onboarding_cubit.dart';
import 'package:netflix_clone/src/presenter/screens/auth/login_screen.dart';
import 'package:netflix_clone/src/presenter/screens/auth/profile_management_screen.dart';
import 'package:netflix_clone/src/presenter/screens/auth/profile_selection_screen.dart';
import 'package:netflix_clone/src/presenter/screens/game/game_screen.dart';
import 'package:netflix_clone/src/presenter/screens/movie/home_screen.dart';
import 'package:netflix_clone/src/presenter/screens/movie/movie_detail_screen.dart';
import 'package:netflix_clone/src/presenter/screens/movie/new_and_hot_screen.dart';
import 'package:netflix_clone/src/presenter/screens/onboarding/onboarding_screen.dart';
import 'package:netflix_clone/src/presenter/screens/splash/splash_screen.dart';

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
  onboarding,
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
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      final authState = context.read<AuthenticationBloc>().state;
      final didCompleteOnboarding = context.read<OnboardingCubit>().state;
      final hasSelected = context.read<ProfilesBloc>().state.hasSelectedProfile;
      final path = state.uri.path;

      if (!didCompleteOnboarding) {
        return path == '/onboarding' ? null : '/onboarding';
      }

      if (authState.status == AuthenticationStatus.unauthenticated) {
        return path == '/login' ? null : '/login';
      }

      if (authState.status == AuthenticationStatus.authenticated &&
          path != '/profileSelection' &&
          !path.startsWith('/home') &&
          !hasSelected) {
        return '/profileSelection';
      }

      if (authState.status == AuthenticationStatus.unknown) {
        return null;
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
        path: '/onboarding',
        name: AppRoute.onboarding.name,
        builder: (context, state) => const OnboardingScreen(),
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
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: HomeScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: ':id',
                    name: AppRoute.movieDetail.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      final movie = state.extra as MovieDetailEntity?;
                      return MaterialPage(
                        fullscreenDialog: true,
                        child: MovieDetailScreen(movieDetail: movie),
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
                pageBuilder: (context, state) => NoTransitionPage(
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
