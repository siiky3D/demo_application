import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/injector.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/bloc/themes_bloc.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/auth/authentication_bloc.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/profile_selection/profile_selection_cubit.dart';

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
        BlocProvider<ProfileSelectionCubit>(
          create: (context) => injector<ProfileSelectionCubit>(),
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
                    locale: const Locale('th', 'TH'),
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
