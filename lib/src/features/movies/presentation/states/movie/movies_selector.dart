import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/presentation/states/export_movie_blocs.dart';

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
          selector: (state) {
            if (state is MoviesSuccess) return state.movies.length;
            if (state is MoviesLoadingMore) return state.movies.length;
            return 0;
          },
          builder: builder,
        );
}

class CurrentMoviesSelector extends MoviesStateSelector<MovieDetailEntity> {
  CurrentMoviesSelector(
    Widget Function(MovieDetailEntity) builder, {
    super.key,
  }) : super(
          selector: (state) {
            if (state is MoviesSuccess) {
              return state.selectedMovie;
            }
            return const MovieDetailEntity();
          },
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
            if (state is MoviesSuccess &&
                index >= 0 &&
                index < state.movies.length) {
              return MovieSelectorState(
                state.movies[index],
                state.selectedMovieIndex == index,
              );
            }
            return const MovieSelectorState(MovieDetailEntity(), false);
          },
          builder: (value) => builder(value.movie, value.selected),
        );
}

class MovieSelectorState {
  const MovieSelectorState(this.movie, this.selected);
  final MovieDetailEntity movie;
  final bool selected;

  @override
  bool operator ==(Object other) =>
      other is MovieSelectorState &&
      movie == other.movie &&
      selected == other.selected;

  @override
  int get hashCode => movie.hashCode ^ selected.hashCode;
}
