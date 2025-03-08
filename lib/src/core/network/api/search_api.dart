import 'package:dio/dio.dart';
import 'package:netflix_clone/src/data/models/movie/movie_listings_model.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: '/search')
abstract class SearchApi {
  factory SearchApi(Dio dio, {String? baseUrl}) = _SearchApi;

  @GET('/movie')
  Future<MovieListingsModel> getSearchMovies(
    @Query('language') String? language,
    @Query('query') String query,
    @Query('page') int page,
  );

  @GET('/tv')
  Future<MovieListingsModel> getSearchSeries(
    @Query('language') String? language,
    @Query('query') String query,
    @Query('page') int page,
  );
}
