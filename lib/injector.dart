import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix_clone/injector.config.dart';
import 'package:netflix_clone/src/core/theme/bloc/themes_bloc.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/auth/authentication_bloc.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/profile_selection/profile_selection_cubit.dart';
import 'package:netflix_clone/src/features/movies/presentation/states/export_movie_blocs.dart';

final injector = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => injector.init();

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();
}

class GlobalBlocProviders extends StatelessWidget {
  const GlobalBlocProviders({
    required this.child,
    super.key,
  });
  final Widget child;

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
        BlocProvider<MoviesBloc>(
          create: (context) => injector<MoviesBloc>(),
        ),
      ],
      child: child,
    );
  }
}
