part of 'movies_bloc.dart';

enum MovieStatus { initial, loading, success, loadMore, failure }

extension MovieStatusX on MovieState {
  MovieStatus get status {
    if (this is MoviesInitial) return MovieStatus.initial;
    if (this is MoviesLoading) return MovieStatus.loading;
    if (this is MoviesSuccess) return MovieStatus.success;
    if (this is MoviesFailure) return MovieStatus.failure;
    return MovieStatus.initial;
  }
}

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MoviesInitial extends MovieState {}

final class MoviesLoading extends MovieState {
  const MoviesLoading();
}

final class MoviesSuccess extends MovieState {
  const MoviesSuccess({
    required this.movies,
    this.selectedMovieIndex = 0,
  });

  final List<MovieDetailEntity> movies;
  final int selectedMovieIndex;

  @override
  List<Object> get props => [movies, selectedMovieIndex];

  MovieDetailEntity get selectedMovie => movies[selectedMovieIndex];
}

final class MoviesLoadingMore extends MovieState {
  const MoviesLoadingMore({
    required this.movies,
    this.canLoadMore = true,
    this.page = 1,
  });

  final bool canLoadMore;
  final int page;
  final List<MovieDetailEntity> movies;

  @override
  List<Object> get props => [movies, canLoadMore, page];
}

final class MoviesFailure extends MovieState {
  const MoviesFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
