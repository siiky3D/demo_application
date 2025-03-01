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

import 'src/core/database/local_database.dart' as _i1040;
import 'src/core/network/api_client.dart' as _i1005;
import 'src/core/network/dio_client.dart' as _i878;
import 'src/core/network/register_module.dart' as _i53;
import 'src/core/theme/cubit/theme_cubit.dart' as _i255;
import 'src/features/authentication/domain/repositories/authentication_repository.dart'
    as _i992;
import 'src/features/authentication/domain/repositories/user_repository.dart'
    as _i78;
import 'src/features/authentication/presentation/blocs/auth/authentication_bloc.dart'
    as _i718;
import 'src/features/movies/data/data_sources/local/movie/movie_local_data_source.dart'
    as _i807;
import 'src/features/movies/data/data_sources/local/movie/movie_local_data_source_impl.dart'
    as _i517;
import 'src/features/movies/data/data_sources/remote/movie_remote_data_source.dart'
    as _i302;
import 'src/features/movies/data/data_sources/remote/movie_remote_data_source_impl.dart'
    as _i814;
import 'src/features/movies/data/repositories/movie/movie_repository_impl.dart'
    as _i1058;
import 'src/features/movies/domain/repositories/movie/movie_repository.dart'
    as _i212;
import 'src/features/movies/domain/usecases/movie/movie_usecases.dart' as _i986;
import 'src/features/movies/domain/usecases/movie/movie_usecases_impl.dart'
    as _i1033;
import 'src/features/movies/presentation/blocs/movie/get_now_playing_movies/get_now_playing_movies_bloc.dart'
    as _i522;
import 'src/features/movies/presentation/blocs/movie/get_popular_movies/get_popular_movies_bloc.dart'
    as _i780;
import 'src/features/movies/presentation/blocs/movie/get_top_rated_movies/get_top_rated_movies_bloc.dart'
    as _i229;
import 'src/features/movies/presentation/blocs/movie/get_up_coming_movies/get_up_coming_movies_bloc.dart'
    as _i634;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i1040.LocalDatabase>(() => _i1040.LocalDatabase());
    gh.lazySingleton<_i878.DioClient>(() => _i878.DioClient());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i1005.ApiClient>(() => registerModule.apiClient);
    gh.lazySingleton<_i255.ThemeCubit>(() => _i255.ThemeCubit());
    gh.lazySingleton<_i992.AuthenticationRepository>(
        () => _i992.AuthenticationRepository());
    gh.lazySingleton<_i78.UserRepository>(() => _i78.UserRepository());
    gh.lazySingleton<_i522.GetNowPlayingMoviesBloc>(
        () => _i522.GetNowPlayingMoviesBloc());
    gh.lazySingleton<_i807.MovieLocalDataSource>(
        () => _i517.MovieLocalDataSourceImpl(gh<_i1040.LocalDatabase>()));
    gh.lazySingleton<_i302.MovieRemoteDataSource>(
        () => _i814.MovieRemoteDataSourceImpl(gh<_i1005.ApiClient>()));
    gh.lazySingleton<_i718.AuthenticationBloc>(() => _i718.AuthenticationBloc(
          authenticationRepository: gh<_i992.AuthenticationRepository>(),
          userRepository: gh<_i78.UserRepository>(),
        ));
    gh.lazySingleton<_i212.MovieRepository>(() => _i1058.MovieRepositoryImpl(
          gh<_i302.MovieRemoteDataSource>(),
          gh<_i807.MovieLocalDataSource>(),
        ));
    gh.lazySingleton<_i986.MovieUsecases>(
        () => _i1033.MovieUsecasesImpl(gh<_i212.MovieRepository>()));
    gh.lazySingleton<_i780.GetPopularMoviesBloc>(
        () => _i780.GetPopularMoviesBloc(gh<_i986.MovieUsecases>()));
    gh.lazySingleton<_i229.GetTopRatedMoviesBloc>(
        () => _i229.GetTopRatedMoviesBloc(gh<_i986.MovieUsecases>()));
    gh.lazySingleton<_i634.GetUpComingMoviesBloc>(
        () => _i634.GetUpComingMoviesBloc(gh<_i986.MovieUsecases>()));
    return this;
  }
}

class _$RegisterModule extends _i53.RegisterModule {}
