import 'package:demo_app_temp/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:equatable/equatable.dart';

class MovieListingsEntity extends Equatable {
  const MovieListingsEntity({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });
  final int? page;
  final List<MovieDetailEntity>? movies;
  final int? totalPages;
  final int? totalResults;

  @override
  List<Object?> get props => [page, movies, totalPages, totalResults];
}
