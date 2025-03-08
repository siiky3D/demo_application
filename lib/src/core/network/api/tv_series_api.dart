import 'package:dio/dio.dart';
import 'package:netflix_clone/src/data/models/movie/movie_listings_model.dart';
import 'package:retrofit/retrofit.dart';

part 'tv_series_api.g.dart';

@RestApi(baseUrl: '/tv')
abstract class TvSeriesApi {
  factory TvSeriesApi(Dio dio, {String? baseUrl}) = _TvSeriesApi;

  @GET('/{series_id}')
  Future<MovieListingsModel> getDetailsSeries(
    @Query('language') String? language,
    @Path('series_id') int seriesId,
  );

  @GET('/{series_id}/recommendations')
  Future<MovieListingsModel> getRecommendationsSeries(
    @Query('language') String? language,
    @Path('series_id') int seriesId,
    @Query('page') int page,
  );
}
