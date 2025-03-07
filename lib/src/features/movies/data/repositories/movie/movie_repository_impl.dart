// ignore_for_file: avoid_catching_errors

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:netflix_clone/src/core/exceptions/database/database_exception.dart';
import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/local/_collections/movie_detail/movie_detail_collection.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/local/movie/movie_local_data_source.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:netflix_clone/src/features/movies/data/models/movies_listings/movie_listings_model.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/repositories/movie/movie_repository.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._remoteDataSource, this._localDataSource);
  final MovieRemoteDataSource _remoteDataSource;
  final MovieLocalDataSource _localDataSource;

  Future<Either<NetworkException, MovieListingsEntity>> _getMovies(
    Future<MovieListingsModel> Function(int page) fetchMovies,
    int page,
  ) async {
    try {
      final result = await fetchMovies(page);
      return Right<NetworkException, MovieListingsEntity>(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  //* REMOTE
  @override
  Future<Either<NetworkException, MovieListingsEntity>> getMovieByType({
    required int page,
    required MovieType movieType,
  }) {
    switch (movieType) {
      case MovieType.nowPlaying:
        return _getMovies(
          (page) => _remoteDataSource.getNowPlayingMovies(page: page),
          page,
        );
      case MovieType.popular:
        return _getMovies(
          (page) => _remoteDataSource.getPopularMovies(page: page),
          page,
        );
      case MovieType.topRated:
        return _getMovies(
          (page) => _remoteDataSource.getTopRatedMovies(page: page),
          page,
        );
      case MovieType.upcoming:
        return _getMovies(
          (page) => _remoteDataSource.getUpcomingMovies(page: page),
          page,
        );
    }
  }

  @override
  Future<Either<NetworkException, MovieDetailEntity>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      final result = await _remoteDataSource.getMovieDetails(
        movieId: movieId,
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override

  //* LOCAL
  @override
  Future<Either<DatabaseException, List<MovieDetailEntity>>>
      getSavedMovieDetails() async {
    try {
      final result = await _localDataSource.getSavedMovieDetails();

      return Right(result.map((e) => e.toEntity()).toList());
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> saveMovieDetails({
    required MovieDetailEntity? movieDetailEntity,
  }) async {
    try {
      final result = await _localDataSource.saveMovieDetail(
        movieDetailCollection:
            MovieDetailCollection().fromEntity(movieDetailEntity),
      );

      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> deleteMovieDetail({
    required int? movieId,
  }) async {
    try {
      final result = await _localDataSource.deleteMovieDetail(movieId: movieId);

      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, bool>> isSavedMovieDetail({
    required int? movieId,
  }) async {
    try {
      final result =
          await _localDataSource.isSavedMovieDetail(movieId: movieId);

      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }
}
