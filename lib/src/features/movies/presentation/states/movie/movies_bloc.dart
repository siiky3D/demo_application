import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases.dart';
import 'package:stream_transform/stream_transform.dart';

part 'movies_event.dart';
part 'movies_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@lazySingleton
class MoviesBloc extends Bloc<MoviesEvent, MovieState> {
  MoviesBloc(this._movieUsecases) : super(const MovieState()) {
    on<MoviesloadStarted>(
      _onLoadStarted,
      transformer: throttleDroppable(throttleDuration),
    );

    on<MoviesLoadByType>(
      _onLoadByType,
      transformer: throttleDroppable(throttleDuration),
    );

    on<MoviesSelectChanged>(_onSelectChanged);
  }

  final List<MovieDetailEntity> _movieList = [];

  final MovieUsecases _movieUsecases;

  int _page = 1;

  bool hasReachedMax = false;

  Future<void> _onLoadStarted(
    MoviesloadStarted event,
    Emitter<MovieState> emit,
  ) async {
    if (hasReachedMax) return;

    if (state.status != MovieStatus.success) {
      emit(state.copyWith(status: MovieStatus.loading));
    }

    final futures = [
      _movieUsecases.getMoviesByType(
        page: _page,
        movieType: MovieType.popular,
      ),
      _movieUsecases.getMoviesByType(
        page: _page,
        movieType: MovieType.topRated,
      ),
      _movieUsecases.getMoviesByType(
        page: _page,
        movieType: MovieType.upcoming,
      ),
      _movieUsecases.getMoviesByType(
        page: _page,
        movieType: MovieType.nowPlaying,
      ),
    ];

    final results = await Future.wait(futures);

    final moviesList = results.map((result) {
      return result.fold(
        (error) {
          emit(state.copyWith(status: MovieStatus.failure, error: error));
          return <MovieDetailEntity>[];
        },
        (success) {
          return success.movies ?? [];
        },
      );
    }).toList();

    final allMovies = moviesList.expand((movies) => movies).toList();

    if (_movieList.isEmpty) {
      _movieList.addAll(allMovies.take(8));
    }

    emit(
      state.copyWith(
        status: MovieStatus.success,
        movies: List.of(_movieList),
        hasReachedMax: hasReachedMax,
      ),
    );
  }

  Future<void> _onLoadByType(
    MoviesLoadByType event,
    Emitter<MovieState> emit,
  ) async {
    if (hasReachedMax) return;

    if (state.status != MovieStatus.success) {
      emit(state.copyWith(status: MovieStatus.loading));
    }

    final result = await _movieUsecases.getMoviesByType(
      page: _page,
      movieType: event.movieType,
    );

    result.fold(
      (error) {
        emit(state.copyWith(status: MovieStatus.failure, error: error));
      },
      (success) {
        _page++;

        final newMovies = success.movies?.take(4).toList() ?? [];

        if (newMovies.isNotEmpty) {
          _movieList.addAll(newMovies);
        } else {
          hasReachedMax = true;
        }

        emit(
          state.copyWith(
            status: MovieStatus.success,
            movies: List.of(_movieList),
            hasReachedMax: hasReachedMax,
          ),
        );
      },
    );
  }

  Future<void> _onSelectChanged(
    MoviesSelectChanged event,
    Emitter<MovieState> emit,
  ) async {
    final result = await _movieUsecases.getMovieDetails(
      movieId: int.parse(event.movieId),
    );
    result.fold(
      (error) {
        emit(state.copyWith(status: MovieStatus.failure, error: error));
      },
      (success) {
        final movieIndex = state.movies.indexWhere(
          (movie) => movie.id == int.parse(event.movieId),
        );

        if (movieIndex == 0 || movieIndex >= state.movies.length) return;

        emit(
          state.copyWith(
            movies: [...state.movies]..setAll(movieIndex, [success]),
            selectedMovieIndex: movieIndex,
          ),
        );
      },
    );
  }
}
