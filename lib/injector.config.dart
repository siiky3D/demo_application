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
import 'package:netflix_clone/src/features/auth/domain/repositories/authentication_repository.dart'
    as _i77;
import 'package:netflix_clone/src/features/auth/domain/repositories/user_repository.dart'
    as _i627;
import 'package:netflix_clone/src/features/auth/presentation/states/auth/authentication_bloc.dart'
    as _i232;
import 'package:netflix_clone/src/features/auth/presentation/states/profile_selection/profile_selection_cubit.dart'
    as _i10;
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
import 'package:netflix_clone/src/features/movies/presentation/states/movie/now_playing_movies/now_playing_movies_bloc.dart'
    as _i651;
import 'package:netflix_clone/src/features/movies/presentation/states/movie/popular_movies/popular_movies_bloc.dart'
    as _i636;
import 'package:netflix_clone/src/features/movies/presentation/states/movie/top_rated_movies/top_rated_movies_bloc.dart'
    as _i829;
import 'package:netflix_clone/src/features/movies/presentation/states/movie/upcoming_movies/upcoming_movies_bloc.dart'
    as _i499;

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
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i699.LocalDatabase>(() => _i699.LocalDatabase());
    gh.lazySingleton<_i520.DioClient>(() => _i520.DioClient());
    gh.lazySingleton<_i224.ThemesBloc>(() => _i224.ThemesBloc());
    gh.lazySingleton<_i651.GetNowPlayingMoviesBloc>(
        () => _i651.GetNowPlayingMoviesBloc());
    gh.lazySingleton<_i77.AuthenticationRepository>(
        () => _i77.AuthenticationRepository());
    gh.lazySingleton<_i627.UserRepository>(() => _i627.UserRepository());
    gh.lazySingleton<_i10.ProfileSelectionCubit>(
        () => _i10.ProfileSelectionCubit());
    gh.lazySingleton<_i35.MovieLocalDataSource>(
        () => _i209.MovieLocalDataSourceImpl(gh<_i699.LocalDatabase>()));
    gh.lazySingleton<_i677.MovieRemoteDataSource>(
        () => _i675.MovieRemoteDataSourceImpl(gh<_i520.DioClient>()));
    gh.lazySingleton<_i232.AuthenticationBloc>(() => _i232.AuthenticationBloc(
          authenticationRepository: gh<_i77.AuthenticationRepository>(),
          userRepository: gh<_i627.UserRepository>(),
        ));
    gh.lazySingleton<_i796.MovieRepository>(() => _i918.MovieRepositoryImpl(
          gh<_i677.MovieRemoteDataSource>(),
          gh<_i35.MovieLocalDataSource>(),
        ));
    gh.lazySingleton<_i483.MovieUsecases>(
        () => _i365.MovieUsecasesImpl(gh<_i796.MovieRepository>()));
    gh.lazySingleton<_i636.PopularMoviesBloc>(
        () => _i636.PopularMoviesBloc(gh<_i483.MovieUsecases>()));
    gh.lazySingleton<_i829.GetTopRatedMoviesBloc>(
        () => _i829.GetTopRatedMoviesBloc(gh<_i483.MovieUsecases>()));
    gh.lazySingleton<_i499.GetUpComingMoviesBloc>(
        () => _i499.GetUpComingMoviesBloc(gh<_i483.MovieUsecases>()));
    return this;
  }
}

class _$RegisterModule extends _i172.RegisterModule {}
