import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases.dart';

part 'get_popular_movies_event.dart';
part 'get_popular_movies_state.dart';

@lazySingleton
class GetPopularMoviesBloc
    extends Bloc<GetPopularMoviesEvent, GetPopularMoviesState> {
  GetPopularMoviesBloc(this._movieUsecases) : super(GetPopularMoviesInitial()) {
    on<FetchPopularMovies>(_onFetchPopularMovies);
  }

  final List<MovieDetailEntity> _movieList = [];

  int _page = 1;

  bool hasReachedMax = false;

  final MovieUsecases _movieUsecases;

  Future<void> _onFetchPopularMovies(
    FetchPopularMovies event,
    Emitter<GetPopularMoviesState> emit,
  ) async {
    if (hasReachedMax) return;

    if (state is! GetPopularMoviesLoaded) {
      emit(const GetPopularMoviesLoading());
    }

    final result = await _movieUsecases.getPopularMovies(page: _page);
    result.fold(
      (error) {
        debugPrint('Error occurred: $error');
        emit(GetPopularMoviesError(message: error.message));
      },
      (success) {
        _page++;
        _movieList.addAll(
          // success.movies?.where(_movieList.contains) ?? [],
          success.movies ?? [],
        );

        if ((success.movies?.length ?? 0) < 20) {
          hasReachedMax = true;
        }
        emit(GetPopularMoviesLoaded(movies: List.of(_movieList)));
      },
    );
  }
}
