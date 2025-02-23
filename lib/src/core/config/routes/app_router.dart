import 'package:auto_route/auto_route.dart';
import 'package:demo_app_temp/src/core/config/constants/path_constants.dart';

import 'package:demo_app_temp/src/core/config/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Widget,Route')
final class AppRouter extends $AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          page: SplashRoute.page,
          path: PathConstants.splash,
          initial: true,
        ),
        AdaptiveRoute(
          page: LoginRoute.page,
          path: PathConstants.login,
        ),
        AdaptiveRoute(
          page: ProfileSelectionRoute.page,
          path: PathConstants.profileSelection,
        ),
        AdaptiveRoute(
          page: MainRoute.page,
          path: PathConstants.main,
          children: [
            RedirectRoute(
              path: '',
              redirectTo: PathConstants.home,
            ),
            AdaptiveRoute(
              page: HomeRoute.page,
              path: PathConstants.home,
              initial: true,
            ),
            AdaptiveRoute(
              page: GamesRoute.page,
              path: PathConstants.games,
            ),
            AdaptiveRoute(
              page: NewAndHotRoute.page,
              path: PathConstants.newAndHot,
            ),
            AdaptiveRoute(
              page: ProfileManagementRoute.page,
              path: PathConstants.profileManagement,
            ),
          ],
        ),
        CustomRoute(
          page: MovieDetailRoute.page,
          path: PathConstants.movieDetail,
          durationInMilliseconds: 800,
          reverseDurationInMilliseconds: 800,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ];
}
