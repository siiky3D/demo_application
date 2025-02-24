import 'package:netflix_clone/src/features/movies/data/models/movie_detail/movie_detail_model.dart';
import 'package:netflix_clone/src/features/movies/data/models/movies_listings/movie_listings_model.dart';

/// Abstract class that defines the methods for fetching popular and top rated
/// movies from a remote data source.
abstract class MovieRemoteDataSource {
  /// Fetches a list of popular movies from the remote data source.
  Future<MovieListingsModel> getPopularMovies({
    required int page,
  });

  /// Fetches a list of top rated movies from the remote data source.
  Future<MovieListingsModel> getTopRatedMovies({
    required int page,
  });

  /// Retrieves the movie details for a given movie ID from the remote
  /// data source.
  Future<MovieDetailModel> getMovieDetails({
    required int movieId,
  });

  /// Retrieves a list of recommended movies for a given movie ID from the
  /// remote data source.
  Future<MovieListingsModel> getRecommendedMovies({
    required int movieId,
    required int page,
  });

  /// Retrieves a list of upcoming movies from the remote data source.
  Future<MovieListingsModel> getUpcomingMovies({
    required int page,
  });

  /// Retrieves a list of now playing movies from the remote data source.
  Future<MovieListingsModel> getNowPlayingMovies({
    required int page,
  });

  /// Retrieves a list of movies based on a search query from the remote
  Future<MovieListingsModel> searchMovies({
    required String query,
    required int page,
  });
}
