import 'package:fpdart/fpdart.dart';
import 'package:netflix_clone/src/core/exceptions/database/database_exception.dart';
import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
import 'package:netflix_clone/src/domain/entities/movie/movie_detail_entity.dart';
import 'package:netflix_clone/src/domain/entities/movie/movie_listings_entity.dart';

abstract class MovieRepository {
  //* Remote Data Source

  Future<Either<NetworkException, MovieListingsEntity>> getMovieByType({
    required int page,
    required MovieType movieType,
  });

  /// Retrieves the details for a specific movie from the server.
  Future<Either<NetworkException, MovieDetailEntity>> getMovieDetails({
    required int movieId,
  });

  //* Local Data Source
  /// Retrieves the saved movie details from the database.
  Future<Either<DatabaseException, List<MovieDetailEntity>>>
      getSavedMovieDetails();

  /// Saves the movie details to the database.
  Future<Either<DatabaseException, void>> saveMovieDetails({
    required MovieDetailEntity? movieDetailEntity,
  });

  /// Deletes the movie detail from the database.
  Future<Either<DatabaseException, void>> deleteMovieDetail({
    required int? movieId,
  });

  /// Checks if the movie detail is saved in the database.
  Future<Either<DatabaseException, bool>> isSavedMovieDetail({
    required int? movieId,
  });
}
