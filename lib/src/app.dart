import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/core/database/local_database.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/network/dio_client.dart';
import 'package:netflix_clone/src/core/theme/app_theme.dart';
import 'package:netflix_clone/src/core/theme/cubit/theme_cubit.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/local/movie/movie_local_data_source.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/local/movie/movie_local_data_source_impl.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/remote/movie_remote_data_source_impl.dart';
import 'package:netflix_clone/src/features/movies/data/repositories/movie/movie_repository_impl.dart';
import 'package:netflix_clone/src/features/movies/domain/repositories/movie/movie_repository.dart';
import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases.dart';
import 'package:netflix_clone/src/features/movies/presentation/blocs/movie/get_popular_movies/get_popular_movies_bloc.dart';
import 'package:netflix_clone/src/features/movies/presentation/blocs/movie/get_top_rated_movies/get_top_rated_movies_bloc.dart';

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
                routerConfig: goRouter(),
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
