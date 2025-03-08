// ignore_for_file: avoid_positional_boolean_parameters

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/domain/entities/movie/movie_detail_entity.dart';
import 'package:netflix_clone/src/presenter/blocs/movie/movies_bloc.dart';

class MoviesStateSelector<T> extends BlocSelector<MoviesBloc, MovieState, T> {
  MoviesStateSelector({
    required super.selector,
    required Widget Function(T) builder,
    super.key,
  }) : super(builder: (_, value) => builder(value));
}

class MoviesStateStatusSelector extends MoviesStateSelector<MovieStatus> {
  MoviesStateStatusSelector(
    Widget Function(MovieStatus) builder, {
    super.key,
  }) : super(
          selector: (state) => state.status,
          builder: builder,
        );
}

class NumberOfMoviesSelector extends MoviesStateSelector<int> {
  NumberOfMoviesSelector(Widget Function(int) builder, {super.key})
      : super(
          selector: (state) => state.movies.length,
          builder: builder,
        );
}

class CurrentMoviesSelector extends MoviesStateSelector<MovieDetailEntity> {
  CurrentMoviesSelector(
    Widget Function(MovieDetailEntity) builder, {
    super.key,
  }) : super(
          selector: (state) => state.selectedMovie,
          builder: builder,
        );
}

class MovieSelector extends MoviesStateSelector<MovieSelectorState> {
  MovieSelector(
    int index,
    Widget Function(MovieDetailEntity, bool) builder, {
    super.key,
  }) : super(
          selector: (state) {
            final isValidIndex = index >= 0 && index < state.movies.length;

            return MovieSelectorState(
              movie: isValidIndex
                  ? state.movies[index]
                  : const MovieDetailEntity(),
              selected: isValidIndex && state.selectedMovieIndex == index,
            );
          },
          builder: (value) => builder(value.movie, value.selected),
        );
}

class MovieSelectorState extends Equatable {
  const MovieSelectorState({
    required this.movie,
    this.selected = false,
  });

  final MovieDetailEntity movie;
  final bool selected;

  MovieSelectorState copyWith({MovieDetailEntity? movie, bool? selected}) {
    return MovieSelectorState(
      movie: movie ?? this.movie,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object> get props => [movie, selected];
}
