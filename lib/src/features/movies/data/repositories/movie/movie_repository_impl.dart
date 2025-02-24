// ignore_for_file: avoid_catching_errors

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:netflix_clone/src/core/exceptions/database/database_exception.dart';
import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/local/_collections/movie_detail/movie_detail_collection.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/local/movie/movie_local_data_source.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/repositories/movie/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieRemoteDataSource, this._movieLocalDataSource);
  final MovieRemoteDataSource _movieRemoteDataSource;
  final MovieLocalDataSource _movieLocalDataSource;

  //* REMOTE
  @override
  Future<Either<NetworkException, MovieDetailEntity>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      final result = await _movieRemoteDataSource.getMovieDetails(
        movieId: movieId,
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieListingsEntity>> getNowPlayingMovies({
    required int page,
  }) async {
    try {
      final result = await _movieRemoteDataSource.getNowPlayingMovies(
        page: page,
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieListingsEntity>> getUpcomingMovies({
    required int page,
  }) async {
    try {
      final result = await _movieRemoteDataSource.getUpcomingMovies(
        page: page,
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({
    required int page,
  }) async {
    try {
      final result = await _movieRemoteDataSource.getPopularMovies(page: page);

      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, MovieListingsEntity>> getTopRatedMovies({
    required int page,
  }) async {
    try {
      final result = await _movieRemoteDataSource.getTopRatedMovies(page: page);

      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  //* LOCAL
  @override
  Future<Either<DatabaseException, List<MovieDetailEntity>>>
      getSavedMovieDetails() async {
    try {
      final result = await _movieLocalDataSource.getSavedMovieDetails();

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
      final result = await _movieLocalDataSource.saveMovieDetail(
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
      final result =
          await _movieLocalDataSource.deleteMovieDetail(movieId: movieId);

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
          await _movieLocalDataSource.isSavedMovieDetail(movieId: movieId);

      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }
}
