import 'package:equatable/equatable.dart';
import 'package:netflix_clone/src/domain/entities/movie/movie_detail_entity.dart';

enum MovieType {
  nowPlaying,
  popular,
  topRated,
  upcoming,
}

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
