import 'package:dio/dio.dart';
import 'package:netflix_clone/src/data/models/movie/movie_detail_model.dart';
import 'package:netflix_clone/src/data/models/movie/movie_listings_model.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: '/movie')
abstract class MovieApi {
  factory MovieApi(Dio dio, {String? baseUrl}) = _MovieApi;

  @GET('/now_playing')
  Future<MovieListingsModel> getNowPlayingMovies(
    @Query('language') String? language,
    @Query('page') int page,
  );

  @GET('/popular')
  Future<MovieListingsModel> getPopularMovies(
    @Query('language') String? language,
    @Query('page') int page,
  );

  @GET('/top_rated')
  Future<MovieListingsModel> getTopRatedMovies(
    @Query('language') String? language,
    @Query('page') int page,
  );

  @GET('/upcoming')
  Future<MovieListingsModel> getUpComingMovies(
    @Query('language') String? language,
    @Query('page') int page,
  );

  @GET('/{movie_id}')
  Future<MovieDetailModel> getDetailMovies(
    @Query('language') String? language,
    @Path('movie_id') int movieId,
  );
}
