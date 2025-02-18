import 'package:demo_app_temp/src/core/config/routes/app_router.dart';
import 'package:demo_app_temp/src/core/l10n/l10n.dart';
import 'package:demo_app_temp/src/core/network/dio_client.dart';
import 'package:demo_app_temp/src/core/theme/app_theme.dart';
import 'package:demo_app_temp/src/core/theme/cubit/theme_cubit.dart';
import 'package:demo_app_temp/src/features/movies/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:demo_app_temp/src/features/movies/data/data_sources/remote/movie_remote_data_source_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

part '../injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => injector<ThemeCubit>()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp.router(
                routerConfig: AppRouter().router,
                restorationScopeId: 'app',
                themeMode: themeState.themeMode,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
