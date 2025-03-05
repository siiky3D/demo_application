import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases.dart';
import 'package:stream_transform/stream_transform.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

@lazySingleton
class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc(this._movieUsecases)
      : super(
          PopularMoviesInitial(),
        ) {
    on<GetPopularMoviesloadStarted>(
      _onFetchPopularMovies,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  final List<MovieDetailEntity> _movieList = [];

  int _page = 1;

  bool hasReachedMax = false;

  final MovieUsecases _movieUsecases;

  Future<void> _onFetchPopularMovies(
    GetPopularMoviesloadStarted event,
    Emitter<PopularMoviesState> emit,
  ) async {
    if (hasReachedMax) return;

    if (state is! PopularMoviesSuccess) {
      emit(const PopularMoviesLoading());
    }

    final result = await _movieUsecases.getPopularMovies(page: _page);
    result.fold(
      (error) {
        debugPrint('Error occurred: $error');
        emit(PopularMoviesFailure(message: error.message));
      },
      (success) {
        _page++;
        _movieList.addAll(
          success.movies ?? [],
        );

        if ((success.movies?.length ?? 0) < 20) {
          hasReachedMax = true;
        }
        emit(PopularMoviesSuccess(movies: List.of(_movieList)));
      },
    );
  }
}
