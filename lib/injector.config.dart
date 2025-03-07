// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:netflix_clone/injector.dart' as _i172;
import 'package:netflix_clone/src/core/database/local_database.dart' as _i699;
import 'package:netflix_clone/src/core/network/dio_client.dart' as _i520;
import 'package:netflix_clone/src/core/theme/bloc/themes_bloc.dart' as _i224;
import 'package:netflix_clone/src/features/auth/data/data_sources/remote/profile_remote_data_source.dart'
    as _i956;
import 'package:netflix_clone/src/features/auth/data/data_sources/remote/profile_remote_data_source_impl.dart'
    as _i62;
import 'package:netflix_clone/src/features/auth/domain/repositories/auth/authentication_repository.dart'
    as _i263;
import 'package:netflix_clone/src/features/auth/domain/repositories/user/user_repository.dart'
    as _i259;
import 'package:netflix_clone/src/features/auth/domain/usecases/profile/profile_usecases.dart'
    as _i914;
import 'package:netflix_clone/src/features/auth/domain/usecases/profile/profile_usecases_impl.dart'
    as _i18;
import 'package:netflix_clone/src/features/auth/presentation/states/auth/authentication_bloc.dart'
    as _i232;
import 'package:netflix_clone/src/features/auth/presentation/states/login/login_bloc.dart'
    as _i486;
import 'package:netflix_clone/src/features/auth/presentation/states/profiles/profiles_bloc.dart'
    as _i161;
import 'package:netflix_clone/src/features/movies/data/data_sources/local/movie/movie_local_data_source.dart'
    as _i35;
import 'package:netflix_clone/src/features/movies/data/data_sources/local/movie/movie_local_data_source_impl.dart'
    as _i209;
import 'package:netflix_clone/src/features/movies/data/data_sources/remote/movie_remote_data_source.dart'
    as _i677;
import 'package:netflix_clone/src/features/movies/data/data_sources/remote/movie_remote_data_source_impl.dart'
    as _i675;
import 'package:netflix_clone/src/features/movies/data/repositories/movie/movie_repository_impl.dart'
    as _i918;
import 'package:netflix_clone/src/features/movies/domain/repositories/movie/movie_repository.dart'
    as _i796;
import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases.dart'
    as _i483;
import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases_impl.dart'
    as _i365;
import 'package:netflix_clone/src/features/movies/presentation/states/movie/movies_bloc.dart'
    as _i37;
import 'package:netflix_clone/src/features/onboarding/data/repositories/onboarding_repository.dart'
    as _i196;
import 'package:netflix_clone/src/features/onboarding/presentation/cubit/onboarding_cubit.dart'
    as _i300;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPrefsModule = _$SharedPrefsModule();
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefsModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i520.DioClient>(() => _i520.DioClient());
    gh.lazySingleton<_i699.LocalDatabase>(() => _i699.LocalDatabase());
    gh.lazySingleton<_i224.ThemesBloc>(() => _i224.ThemesBloc());
    gh.lazySingleton<_i263.AuthenticationRepository>(
        () => _i263.AuthenticationRepository());
    gh.lazySingleton<_i259.UserRepository>(() => _i259.UserRepository());
    gh.lazySingleton<_i956.ProfileRemoteDataSource>(
        () => _i62.ProfileRemoteDataSourceImpl(gh<_i520.DioClient>()));
    gh.lazySingleton<_i35.MovieLocalDataSource>(
        () => _i209.MovieLocalDataSourceImpl(gh<_i699.LocalDatabase>()));
    gh.lazySingleton<_i914.ProfileUsecases>(() => _i18.ProfileUsecasesImpl());
    gh.lazySingleton<_i677.MovieRemoteDataSource>(
        () => _i675.MovieRemoteDataSourceImpl(gh<_i520.DioClient>()));
    gh.lazySingleton<_i196.OnboardingRepository>(
        () => _i196.OnboardingRepository(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i232.AuthenticationBloc>(() => _i232.AuthenticationBloc(
          authenticationRepository: gh<_i263.AuthenticationRepository>(),
          userRepository: gh<_i259.UserRepository>(),
        ));
    gh.lazySingleton<_i486.LoginBloc>(() => _i486.LoginBloc(
        authenticationRepository: gh<_i263.AuthenticationRepository>()));
    gh.lazySingleton<_i300.OnboardingCubit>(
        () => _i300.OnboardingCubit(gh<_i196.OnboardingRepository>()));
    gh.lazySingleton<_i161.ProfilesBloc>(
        () => _i161.ProfilesBloc(gh<_i914.ProfileUsecases>()));
    gh.lazySingleton<_i796.MovieRepository>(() => _i918.MovieRepositoryImpl(
          gh<_i677.MovieRemoteDataSource>(),
          gh<_i35.MovieLocalDataSource>(),
        ));
    gh.lazySingleton<_i483.MovieUsecases>(
        () => _i365.MovieUsecasesImpl(gh<_i796.MovieRepository>()));
    gh.lazySingleton<_i37.MoviesBloc>(
        () => _i37.MoviesBloc(gh<_i483.MovieUsecases>()));
    return this;
  }
}

class _$SharedPrefsModule extends _i172.SharedPrefsModule {}

class _$RegisterModule extends _i172.RegisterModule {}
