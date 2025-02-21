import 'package:auto_route/auto_route.dart';
import 'package:demo_app_temp/src/core/config/constants/path_constants.dart';

import 'package:demo_app_temp/src/core/config/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Widget,Route')
final class AppRouter extends $AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: PathConstants.splash,
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: PathConstants.login,
        ),
        AutoRoute(
          page: ProfileSelectionRoute.page,
          path: PathConstants.profileSelection,
        ),
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: PathConstants.home,
              initial: true,
            ),
            AutoRoute(
              page: GamesRoute.page,
              path: PathConstants.games,
            ),
            AutoRoute(
              page: NewAndHotRoute.page,
              path: PathConstants.newAndHot,
            ),
            AutoRoute(
              page: ProfileManagementRoute.page,
              path: PathConstants.profileManagement,
            ),
          ],
        ),
      ];
}
