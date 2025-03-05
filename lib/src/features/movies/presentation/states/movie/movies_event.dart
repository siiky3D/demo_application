part of 'movies_bloc.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class MoviesloadStarted extends MoviesEvent {
  const MoviesloadStarted({required this.movieType});

  final MovieType movieType;

  @override
  List<Object> get props => [movieType];
}

class MoviesSelectChanged extends MoviesEvent {
  const MoviesSelectChanged({required this.movieId});

  final String movieId;

  @override
  List<Object> get props => [movieId];
}
