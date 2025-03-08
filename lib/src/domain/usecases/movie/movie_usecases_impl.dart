import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
import 'package:netflix_clone/src/domain/entities/movie/movie_detail_entity.dart';
import 'package:netflix_clone/src/domain/entities/movie/movie_listings_entity.dart';
import 'package:netflix_clone/src/domain/repositories/movie/movie_repository.dart';
import 'package:netflix_clone/src/domain/usecases/movie/movie_usecases.dart';

@LazySingleton(as: MovieUsecases)
class MovieUsecasesImpl implements MovieUsecases {
  const MovieUsecasesImpl(this._movieRepository);
  final MovieRepository _movieRepository;

  @override
  Future<Either<NetworkException, MovieListingsEntity>> getMoviesByType({
    required int page,
    required MovieType movieType,
  }) async {
    return _movieRepository.getMovieByType(page: page, movieType: movieType);
  }

  @override
  Future<Either<NetworkException, MovieDetailEntity>> getMovieDetails({
    required int movieId,
  }) async {
    return _movieRepository.getMovieDetails(movieId: movieId);
  }
}
