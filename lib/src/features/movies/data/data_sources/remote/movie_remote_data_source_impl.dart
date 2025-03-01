import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/core/network/api_client.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:netflix_clone/src/features/movies/data/models/movie_detail/movie_detail_model.dart';
import 'package:netflix_clone/src/features/movies/data/models/movies_listings/movie_listings_model.dart';

@LazySingleton(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  MovieRemoteDataSourceImpl(this._apiClient)
      : _deviceLocale = PlatformDispatcher.instance.locale.languageCode;
  final ApiClient _apiClient;
  final String _deviceLocale;

  /// Retrieves a list of popular movies from the remote data source.
  @override
  Future<MovieListingsModel> getPopularMovies({
    required int page,
  }) async {
    return _apiClient.getPopularMovies(_deviceLocale, page);
  }

  /// Retrieves a list of top rated movies from the remote data source.
  @override
  Future<MovieListingsModel> getTopRatedMovies({
    required int page,
  }) async {
    return _apiClient.getTopRatedMovies(_deviceLocale, page);
  }

  /// Retrieves the movie credits for a given movie ID from the
  /// remote data source.

  @override
  Future<MovieDetailModel> getMovieDetails({
    required int movieId,
  }) async {
    return _apiClient.getDetailMovies(_deviceLocale, movieId);
  }

  @override
  Future<MovieListingsModel> getNowPlayingMovies({
    required int page,
  }) async {
    return _apiClient.getNowPlayingMovies(_deviceLocale, page);
  }

  @override
  Future<MovieListingsModel> getRecommendedMovies({
    required int movieId,
    required int page,
  }) async {
    return _apiClient.getRecommendationsSeries(
      _deviceLocale,
      movieId,
      page,
    );
  }

  @override
  Future<MovieListingsModel> getUpcomingMovies({
    required int page,
  }) async {
    return _apiClient.getUpComingMovies(_deviceLocale, page);
  }

  @override
  Future<MovieListingsModel> searchMovies({
    required String query,
    required int page,
  }) async {
    return _apiClient.getSearchMovies(_deviceLocale, query, page);
  }
}
