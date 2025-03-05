part of 'popular_movies_bloc.dart';

sealed class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMoviesloadStarted extends PopularMoviesEvent {
  const GetPopularMoviesloadStarted({this.loadAll = false});

  final bool loadAll;

  @override
  List<Object> get props => [loadAll];
}

class GetPopularMoviesloadMoreStarted extends PopularMoviesEvent {
  const GetPopularMoviesloadMoreStarted();

  @override
  List<Object> get props => [];
}

class GetPopularMoviesselectChanged extends PopularMoviesEvent {
  const GetPopularMoviesselectChanged({required this.movieId});

  final String movieId;

  @override
  List<Object> get props => [movieId];
}
