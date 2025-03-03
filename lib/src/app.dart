import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/injector.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/bloc/themes_bloc.dart';
import 'package:netflix_clone/src/features/authentication/presentation/blocs/auth/authentication_bloc.dart';
import 'package:netflix_clone/src/features/movies/presentation/blocs/movie/get_popular_movies/get_popular_movies_bloc.dart';
import 'package:netflix_clone/src/features/movies/presentation/blocs/movie/get_top_rated_movies/get_top_rated_movies_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => injector<AuthenticationBloc>(),
        ),
        BlocProvider<ThemesBloc>(
          create: (context) => injector<ThemesBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return BlocBuilder<ThemesBloc, ThemesState>(
            builder: (context, state) {
              return switch (state) {
                ThemesInitial() => MaterialApp.router(
                    routerConfig: goRouter(context),
                    restorationScopeId: 'app',
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    debugShowCheckedModeBanner: false,
                    scrollBehavior: AppScrollBehavior(),
                    theme: state.theme.themeData,
                  ),
                ThemesDark() => MaterialApp.router(
                    routerConfig: goRouter(context),
                    restorationScopeId: 'app',
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    debugShowCheckedModeBanner: false,
                    scrollBehavior: AppScrollBehavior(),
                    theme: state.theme.themeData,
                  ),
                ThemesLight() => MaterialApp.router(
                    routerConfig: goRouter(context),
                    restorationScopeId: 'app',
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    debugShowCheckedModeBanner: false,
                    scrollBehavior: AppScrollBehavior(),
                    theme: state.theme.themeData,
                  ),
              };
            },
          );
        },
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
