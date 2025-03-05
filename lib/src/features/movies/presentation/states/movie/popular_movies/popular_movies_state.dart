part of 'popular_movies_bloc.dart';

sealed class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoading extends PopularMoviesState {
  const PopularMoviesLoading();
}

final class PopularMoviesSuccess extends PopularMoviesState {
  const PopularMoviesSuccess({required this.movies});

  final List<MovieDetailEntity> movies;

  @override
  List<Object> get props => [movies];
}

final class PopularMoviesLoadingMore extends PopularMoviesState {
  const PopularMoviesLoadingMore({
    this.canLoadMore = true,
    this.page = 1,
  });

  final bool canLoadMore;
  final int page;

  @override
  List<Object> get props => [canLoadMore, page];
}

final class PopularMoviesFailure extends PopularMoviesState {
  const PopularMoviesFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
