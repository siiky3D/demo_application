import 'package:demo_app_temp/src/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  splash,
  login,
  register,
  onboarding,
  selectedAudience,
  home,
}

class AppRouter {
  AppRouter();

  GoRouter get router {
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      redirect: (context, state) {
        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          name: Routes.splash.name,
          pageBuilder: (context, state) => const MaterialPage(
            child: SplashScreen(),
          ),
        ),
        // StatefulShellRoute.indexedStack(
        //   branches: [],
        // ),
      ],
    );
  }
}
