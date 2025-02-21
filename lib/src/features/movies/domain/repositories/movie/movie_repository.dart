import 'package:demo_app_temp/src/core/exceptions/database/database_exception.dart';
import 'package:demo_app_temp/src/core/exceptions/network/network_exception.dart';
import 'package:demo_app_temp/src/features/movies/domain/entities/movie_credit/movie_credit_entity.dart';
import 'package:demo_app_temp/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:demo_app_temp/src/features/movies/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class MovieRepository {
  //* Remote Data Source
  /// Retrieves the top rated movies from the server.
  Future<Either<NetworkException, MovieListingsEntity>> getTopRatedMovies(
      {required int page});

  /// Retrieves the popular movies from the server.
  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies(
      {required int page});

  /// Retrieves the credits for a specific movie from the server.
  Future<Either<NetworkException, MovieCreditEntity>> getMovieCredits(
      {required int movieId});

  //* Local Data Source
  /// Retrieves the saved movie details from the database.
  Future<Either<DatabaseException, List<MovieDetailEntity>>>
      getSavedMovieDetails();

  /// Saves the movie details to the database.
  Future<Either<DatabaseException, void>> saveMovieDetails(
      {required MovieDetailEntity? movieDetailEntity});

  /// Deletes the movie detail from the database.
  Future<Either<DatabaseException, void>> deleteMovieDetail(
      {required int? movieId});

  /// Checks if the movie detail is saved in the database.
  Future<Either<DatabaseException, bool>> isSavedMovieDetail(
      {required int? movieId});
}
