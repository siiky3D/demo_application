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
import 'package:netflix_clone/src/data/data_sources/local/movie/movie_local_data_source.dart'
    as _i939;
import 'package:netflix_clone/src/data/data_sources/local/movie/movie_local_data_source_impl.dart'
    as _i89;
import 'package:netflix_clone/src/data/data_sources/remote/actor/actor_remote_data_source.dart'
    as _i1044;
import 'package:netflix_clone/src/data/data_sources/remote/actor/actor_remote_data_source_impl.dart'
    as _i175;
import 'package:netflix_clone/src/data/data_sources/remote/auth/profile_remote_data_source.dart'
    as _i1014;
import 'package:netflix_clone/src/data/data_sources/remote/auth/profile_remote_data_source_impl.dart'
    as _i120;
import 'package:netflix_clone/src/data/data_sources/remote/movie/movie_remote_data_source.dart'
    as _i914;
import 'package:netflix_clone/src/data/data_sources/remote/movie/movie_remote_data_source_impl.dart'
    as _i974;
import 'package:netflix_clone/src/data/repositories/actor/actor_repository_impl.dart'
    as _i158;
import 'package:netflix_clone/src/data/repositories/movie/movie_repository_impl.dart'
    as _i1067;
import 'package:netflix_clone/src/data/repositories/onboarding/onboarding_repository.dart'
    as _i778;
import 'package:netflix_clone/src/domain/repositories/actor/actor_repository.dart'
    as _i605;
import 'package:netflix_clone/src/domain/repositories/auth/authentication_repository.dart'
    as _i318;
import 'package:netflix_clone/src/domain/repositories/auth/user_repository.dart'
    as _i367;
import 'package:netflix_clone/src/domain/repositories/movie/movie_repository.dart'
    as _i149;
import 'package:netflix_clone/src/domain/usecases/actor/actor_usecases.dart'
    as _i411;
import 'package:netflix_clone/src/domain/usecases/auth/profile_usecases.dart'
    as _i1030;
import 'package:netflix_clone/src/domain/usecases/auth/profile_usecases_impl.dart'
    as _i188;
import 'package:netflix_clone/src/domain/usecases/movie/movie_usecases.dart'
    as _i375;
import 'package:netflix_clone/src/domain/usecases/movie/movie_usecases_impl.dart'
    as _i748;
import 'package:netflix_clone/src/presenter/blocs/auth/authentication_bloc.dart'
    as _i509;
import 'package:netflix_clone/src/presenter/blocs/auth/login_bloc.dart'
    as _i846;
import 'package:netflix_clone/src/presenter/blocs/auth/profiles_bloc.dart'
    as _i606;
import 'package:netflix_clone/src/presenter/blocs/movie/movies_bloc.dart'
    as _i30;
import 'package:netflix_clone/src/presenter/blocs/onboarding/onboarding_cubit.dart'
    as _i417;
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
    gh.lazySingleton<_i318.AuthenticationRepository>(
        () => _i318.AuthenticationRepository());
    gh.lazySingleton<_i367.UserRepository>(() => _i367.UserRepository());
    gh.lazySingleton<_i914.MovieRemoteDataSource>(
        () => _i974.MovieRemoteDataSourceImpl(gh<_i520.DioClient>()));
    gh.lazySingleton<_i1044.ActorRemoteDataSource>(
        () => _i175.ActorRemoteDataSourceImpl(gh<_i520.DioClient>()));
    gh.lazySingleton<_i939.MovieLocalDataSource>(
        () => _i89.MovieLocalDataSourceImpl(gh<_i699.LocalDatabase>()));
    gh.lazySingleton<_i1014.ProfileRemoteDataSource>(
        () => _i120.ProfileRemoteDataSourceImpl(gh<_i520.DioClient>()));
    gh.lazySingleton<_i846.LoginBloc>(() => _i846.LoginBloc(
        authenticationRepository: gh<_i318.AuthenticationRepository>()));
    gh.lazySingleton<_i1030.ProfileUsecases>(() => _i188.ProfileUsecasesImpl());
    gh.lazySingleton<_i509.AuthenticationBloc>(() => _i509.AuthenticationBloc(
          authenticationRepository: gh<_i318.AuthenticationRepository>(),
          userRepository: gh<_i367.UserRepository>(),
        ));
    gh.lazySingleton<_i778.OnboardingRepository>(
        () => _i778.OnboardingRepository(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i605.ActorRepository>(
        () => _i158.ActorRepositoryImpl(gh<_i1044.ActorRemoteDataSource>()));
    gh.lazySingleton<_i411.ActorUsecases>(
        () => _i411.ActorUsecases(gh<_i605.ActorRepository>()));
    gh.lazySingleton<_i606.ProfilesBloc>(
        () => _i606.ProfilesBloc(gh<_i1030.ProfileUsecases>()));
    gh.lazySingleton<_i149.MovieRepository>(() => _i1067.MovieRepositoryImpl(
          gh<_i914.MovieRemoteDataSource>(),
          gh<_i939.MovieLocalDataSource>(),
        ));
    gh.lazySingleton<_i375.MovieUsecases>(
        () => _i748.MovieUsecasesImpl(gh<_i149.MovieRepository>()));
    gh.lazySingleton<_i417.OnboardingCubit>(
        () => _i417.OnboardingCubit(gh<_i778.OnboardingRepository>()));
    gh.lazySingleton<_i30.MoviesBloc>(
        () => _i30.MoviesBloc(gh<_i375.MovieUsecases>()));
    return this;
  }
}

class _$SharedPrefsModule extends _i172.SharedPrefsModule {}

class _$RegisterModule extends _i172.RegisterModule {}
