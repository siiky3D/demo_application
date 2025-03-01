import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/injector.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/app_theme.dart';
import 'package:netflix_clone/src/core/theme/cubit/theme_cubit.dart';
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
        BlocProvider<ThemeCubit>(
          create: (context) => injector<ThemeCubit>(),
        ),

        //TODO: remove this later
        BlocProvider<GetPopularMoviesBloc>(
          create: (context) => injector<GetPopularMoviesBloc>(),
        ),
        BlocProvider<GetTopRatedMoviesBloc>(
          create: (context) => injector<GetTopRatedMoviesBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp.router(
                routerConfig: goRouter(context),
                restorationScopeId: 'app',
                themeMode: themeState.themeMode,
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
