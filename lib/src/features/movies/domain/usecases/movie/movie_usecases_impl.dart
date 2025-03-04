import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/repositories/movie/movie_repository.dart';
import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases.dart';

@LazySingleton(as: MovieUsecases)
class MovieUsecasesImpl implements MovieUsecases {
  const MovieUsecasesImpl(this._movieRepository);
  final MovieRepository _movieRepository;

  @override
  Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({
    required int page,
  }) async {
    return _movieRepository.getPopularMovies(page: page);
    // return _getMoviesFromMockData();
  }

  @override
  Future<Either<NetworkException, MovieListingsEntity>> getTopRatedMovies({
    required int page,
  }) async {
    return _movieRepository.getTopRatedMovies(page: page);
  }

  @override
  Future<Either<NetworkException, MovieListingsEntity>> getUpcomingMovies({
    required int page,
  }) async {
    return _movieRepository.getUpcomingMovies(page: page);
  }

  @override
  Future<Either<NetworkException, MovieDetailEntity>> getMovieDetails({
    required int movieId,
  }) async {
    return _movieRepository.getMovieDetails(movieId: movieId);
  }

  @override
  Future<Either<NetworkException, MovieListingsEntity>> getNowPlayingMovies({
    required int page,
  }) async {
    return _movieRepository.getNowPlayingMovies(page: page);
  }
}
