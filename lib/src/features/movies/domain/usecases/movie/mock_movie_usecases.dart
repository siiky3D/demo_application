// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:injectable/injectable.dart';
// import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
// import 'package:netflix_clone/src/features/movies/data/models/movie_detail/movie_detail_model.dart';
// import 'package:netflix_clone/src/features/movies/data/models/movies_listings/movie_listings_model.dart';
// import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
// import 'package:netflix_clone/src/features/movies/domain/entities/movie_listings/movie_listings_entity.dart';
// import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases.dart';

// @Environment('dev')
// @lazySingleton
// class MockMovieUsecasesImpl implements MovieUsecases {
//   @override
//   Future<Either<NetworkException, MovieListingsEntity>> getPopularMovies({
//     required int page,
//   }) async {
//     return _getMoviesFromMockData();
//   }

//   @override
//   Future<Either<NetworkException, MovieListingsEntity>> getTopRatedMovies({
//     required int page,
//   }) async {
//     return _getMoviesFromMockData();
//   }

//   @override
//   Future<Either<NetworkException, MovieListingsEntity>> getUpcomingMovies({
//     required int page,
//   }) async {
//     return _getMoviesFromMockData();
//   }

//   @override
//   Future<Either<NetworkException, MovieDetailEntity>> getMovieDetails({
//     required int movieId,
//   }) async {
//     return _getMovieDetailFromMockData(movieId);
//   }

//   @override
//   Future<Either<NetworkException, MovieListingsEntity>> getNowPlayingMovies({
//     required int page,
//   }) async {
//     return _getMoviesFromMockData();
//   }

//   Future<Either<NetworkException, MovieListingsEntity>>
//       _getMoviesFromMockData() async {
//     final response = await rootBundle
//         .loadString('assets/mock/movie_listings_dummy_data.json');
//     final data = json.decode(response) as Map<String, dynamic>;
//     final movieListingsModel = MovieListingsModel.fromJson(data);
//     return Right(movieListingsModel.toEntity());
//   }

//   Future<Either<NetworkException, MovieDetailEntity>>
//       _getMovieDetailFromMockData(int movieId) async {
//     final response =
//         await rootBundle.loadString('assets/mock/movie_detail_dummy_data.json');
//     final data = json.decode(response) as Map<String, dynamic>;

//     final movieDetailModel = MovieDetailModel.fromJson(data);
//     return Right(movieDetailModel.toEntity());
//   }
// }
