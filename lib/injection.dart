part of 'src/app.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector
        //* Network
        ..registerLazySingleton<DioClient>(DioClient.new)

        //* Database
        ..registerLazySingleton<LocalDatabase>(LocalDatabase.new)

        //* Data Sources
        ..registerLazySingleton<MovieRemoteDataSource>(
            () => MovieRemoteDataSourceImpl(injector()),)
        ..registerLazySingleton<MovieLocalDataSource>(
            () => MovieLocalDataSourceImpl(injector<LocalDatabase>()),)
        // ..registerLazySingleton<ActorRemoteDataSource>(() => ActorRemoteDataSourceImpl(injector()))

        //* Repositories
        ..registerLazySingleton<MovieRepository>(
            () => MovieRepositoryImpl(injector(), injector()),)
        // ..registerLazySingleton<ActorRepository>(() => ActorRepositoryImpl(injector()))

        //* Usecases
        ..registerLazySingleton<MovieUsecases>(() => MovieUsecases(injector()))
        // ..registerLazySingleton<ActorUsecases>(() => ActorUsecases(injector()))

        //* Cubits
        ..registerLazySingleton<ThemeCubit>(ThemeCubit.new)
        ..registerLazySingleton<GetPopularMoviesBloc>(
            () => GetPopularMoviesBloc(injector()),)
        ..registerLazySingleton<GetTopRatedMoviesBloc>(
            () => GetTopRatedMoviesBloc(injector()),)
      // ..registerLazySingleton<GetSavedMoviesCubit>(() => GetSavedMoviesCubit(injector()))
      // ..registerFactory<ToggleBookmarkCubit>(() => ToggleBookmarkCubit(injector()))
      // ..registerFactory<GetMovieCreditsCubit>(() => GetMovieCreditsCubit(injector()))
      // ..registerLazySingleton<GetActorDetailCubit>(() => GetActorDetailCubit(injector()))
      // ..registerFactory<GetActorSocialMediaCubit>(() => GetActorSocialMediaCubit(injector()))
      ;
}
