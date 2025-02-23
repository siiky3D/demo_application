import 'package:demo_app_temp/src/core/config/routes/app_route_observer.dart';
import 'package:demo_app_temp/src/core/config/routes/app_router.dart';
import 'package:demo_app_temp/src/core/database/local_database.dart';
import 'package:demo_app_temp/src/core/l10n/l10n.dart';
import 'package:demo_app_temp/src/core/network/dio_client.dart';
import 'package:demo_app_temp/src/core/theme/app_theme.dart';
import 'package:demo_app_temp/src/core/theme/cubit/theme_cubit.dart';
import 'package:demo_app_temp/src/features/movies/data/data_sources/local/movie/movie_local_data_source.dart';
import 'package:demo_app_temp/src/features/movies/data/data_sources/local/movie/movie_local_data_source_impl.dart';
import 'package:demo_app_temp/src/features/movies/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:demo_app_temp/src/features/movies/data/data_sources/remote/movie_remote_data_source_impl.dart';
import 'package:demo_app_temp/src/features/movies/data/repositories/movie/movie_repository_impl.dart';
import 'package:demo_app_temp/src/features/movies/domain/repositories/movie/movie_repository.dart';
import 'package:demo_app_temp/src/features/movies/domain/usecases/movie/movie_usecases.dart';
import 'package:demo_app_temp/src/features/movies/presentation/states/movie/get_popular_movies/bloc/get_popular_movies_bloc.dart';
import 'package:demo_app_temp/src/features/movies/presentation/states/movie/get_top_rated_movies/get_top_rated_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

part '../injection.dart';

final router = AppRouter();

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
              final observer = AppRouteObserver();

              return MaterialApp.router(
                routerConfig: router.config(
                  navigatorObservers: () => [observer],
                ),
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
