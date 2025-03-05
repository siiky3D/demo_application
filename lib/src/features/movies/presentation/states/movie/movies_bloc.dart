import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases.dart';
import 'package:stream_transform/stream_transform.dart';

part 'movies_event.dart';
part 'movies_state.dart';

@lazySingleton
class MoviesBloc extends Bloc<MoviesEvent, MovieState> {
  MoviesBloc(this._movieUsecases) : super(MoviesInitial()) {
    on<MoviesloadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );

    on<MoviesSelectChanged>(
      _onSelectChanged,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
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

    if (state is! MoviesSuccess) {
      emit(const MoviesLoading());
    }

    final result = await _movieUsecases.getMoviesByType(
      page: _page,
      movieType: event.movieType,
    );
    result.fold(
      (error) {
        emit(MoviesFailure(message: error.message));
      },
      (success) {
        _page++;
        _movieList.addAll(
          success.movies ?? [],
        );

        if ((success.movies?.length ?? 0) < 5) {
          hasReachedMax = true;
        }
        emit(MoviesSuccess(movies: List.of(_movieList)));
      },
    );
  }

  void _onSelectChanged(
    MoviesSelectChanged event,
    Emitter<MovieState> emit,
  ) async {
    final result = await _movieUsecases.getMovieDetails(
      movieId: int.parse(event.movieId),
    );
    result.fold(
      (error) {
        emit(MoviesFailure(message: error.message));
      },
      (success) {},
    );
  }
}
