import 'package:fpdart/fpdart.dart';
import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_listings/movie_listings_entity.dart';

abstract class MovieUsecases {
  Future<Either<NetworkException, MovieListingsEntity>> getMoviesByType({
    required int page,
    required MovieType movieType,
  });

  Future<Either<NetworkException, MovieDetailEntity>> getMovieDetails({
    required int movieId,
  });
}
