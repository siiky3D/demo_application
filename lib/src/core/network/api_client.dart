import 'package:dio/dio.dart';
import 'package:netflix_clone/src/features/movies/data/models/movie_detail/movie_detail_model.dart';
import 'package:netflix_clone/src/features/movies/data/models/movies_listings/movie_listings_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/movie/now_playing')
  Future<MovieListingsModel> getNowPlayingMovies(
    @Query('language') String? language,
    @Query('page') int page,
  );

  @GET('/movie/popular')
  Future<MovieListingsModel> getPopularMovies(
    @Query('language') String? language,
    @Query('page') int page,
  );

  @GET('/movie/top_rated')
  Future<MovieListingsModel> getTopRatedMovies(
    @Query('language') String? language,
    @Query('page') int page,
  );

  @GET('/movie/upcoming')
  Future<MovieListingsModel> getUpComingMovies(
    @Query('language') String? language,
    @Query('page') int page,
  );

  @GET('/movie/{movie_id}')
  Future<MovieDetailModel> getDetailMovies(
    @Query('language') String? language,
    @Path('movie_id') int movieId,
  );

  @GET('/tv/{series_id}/recommendations')
  Future<MovieListingsModel> getRecommendationsSeries(
    @Query('language') String? language,
    @Path('series_id') int seriesId,
    @Query('page') int page,
  );

  @GET('/search/movie')
  Future<MovieListingsModel> getSearchMovies(
    @Query('language') String? language,
    @Query('query') String query,
    @Query('page') int page,
  );
}
