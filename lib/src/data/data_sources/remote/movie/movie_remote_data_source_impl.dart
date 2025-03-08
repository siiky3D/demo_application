import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/core/network/dio_client.dart';
import 'package:netflix_clone/src/data/data_sources/remote/movie/movie_remote_data_source.dart';
import 'package:netflix_clone/src/data/models/movie/movie_detail_model.dart';
import 'package:netflix_clone/src/data/models/movie/movie_listings_model.dart';

@LazySingleton(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  MovieRemoteDataSourceImpl(this._dioClient)
      : _deviceLocale = PlatformDispatcher.instance.locale.languageCode;
  final DioClient _dioClient;
  final String _deviceLocale;

  @override
  Future<MovieListingsModel> getPopularMovies({
    required int page,
  }) async {
    return _dioClient.movieApiClient.getPopularMovies(_deviceLocale, page);
  }

  @override
  Future<MovieListingsModel> getTopRatedMovies({
    required int page,
  }) async {
    return _dioClient.movieApiClient.getTopRatedMovies(_deviceLocale, page);
  }

  @override
  Future<MovieDetailModel> getMovieDetails({
    required int movieId,
  }) async {
    return _dioClient.movieApiClient.getDetailMovies(_deviceLocale, movieId);
  }

  @override
  Future<MovieListingsModel> getNowPlayingMovies({
    required int page,
  }) async {
    return _dioClient.movieApiClient.getNowPlayingMovies(_deviceLocale, page);
  }

  @override
  Future<MovieListingsModel> getUpcomingMovies({
    required int page,
  }) async {
    return _dioClient.movieApiClient.getUpComingMovies(_deviceLocale, page);
  }

  @override
  Future<MovieListingsModel> getRecommendedMovies({
    required int movieId,
    required int page,
  }) async {
    return _dioClient.tvSeriesApiClient.getRecommendationsSeries(
      _deviceLocale,
      movieId,
      page,
    );
  }

  @override
  Future<MovieListingsModel> searchMovies({
    required String query,
    required int page,
  }) async {
    return _dioClient.searchApiClient.getSearchMovies(
      _deviceLocale,
      query,
      page,
    );
  }
}
