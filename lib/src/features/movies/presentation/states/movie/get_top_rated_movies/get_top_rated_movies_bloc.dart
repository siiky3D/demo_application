import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases.dart';

part 'get_top_rated_movies_event.dart';
part 'get_top_rated_movies_state.dart';

@lazySingleton
class GetTopRatedMoviesBloc
    extends Bloc<GetTopRatedMoviesEvent, GetTopRatedMoviesState> {
  GetTopRatedMoviesBloc(this._movieUsecases)
      : super(GetTopRatedMoviesInitial()) {
    on<FetchTopRatedMovies>(_onFetchTopRatedMovies);
  }

  final List<MovieDetailEntity> _movieList = [];

  int _page = 1;

  bool hasReachedMax = false;

  final MovieUsecases _movieUsecases;

  Future<void> _onFetchTopRatedMovies(
    FetchTopRatedMovies event,
    Emitter<GetTopRatedMoviesState> emit,
  ) async {
    try {
      if (hasReachedMax) return;

      if (state is! GetTopRatedMoviesLoaded) {
        emit(const GetTopRatedMoviesLoading());
      }

      final result = await _movieUsecases.getTopRatedMovies(page: _page);

      result.fold(
        (error) => emit(GetTopRatedMoviesError(message: error.message)),
        (success) {
          _page++;
          _movieList.addAll(
            success.movies
                    ?.where((movie) => _movieList.contains(movie) == false) ??
                [],
          );

          if ((success.movies?.length ?? 0) < 20) {
            hasReachedMax = true;
          }

          emit(GetTopRatedMoviesLoaded(movies: List.of(_movieList)));
        },
      );
    } catch (_) {
      rethrow;
    }
  }
}
