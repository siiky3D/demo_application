import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix_clone/injector.config.dart';
import 'package:netflix_clone/src/core/theme/bloc/themes_bloc.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/auth/authentication_bloc.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/profiles/profiles_bloc.dart';
import 'package:netflix_clone/src/features/movies/presentation/states/export_movie_blocs.dart';
import 'package:netflix_clone/src/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => injector.init();

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();
}

@module
abstract class SharedPrefsModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
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
          lazy: false,
          create: (context) => injector<AuthenticationBloc>()
            ..add(AuthenticationSubscriptionRequested()),
        ),
        BlocProvider<ThemesBloc>(
          create: (context) => injector<ThemesBloc>(),
        ),
        BlocProvider<ProfilesBloc>(
          create: (context) => injector<ProfilesBloc>(),
        ),
        BlocProvider<MoviesBloc>(
          create: (context) => injector<MoviesBloc>(),
        ),
        BlocProvider<OnboardingCubit>(
          create: (context) => injector<OnboardingCubit>(),
        ),
      ],
      child: child,
    );
  }
}
