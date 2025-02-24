import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases.dart';

part 'get_popular_movies_event.dart';
part 'get_popular_movies_state.dart';

class GetPopularMoviesBloc
    extends Bloc<GetPopularMoviesEvent, GetPopularMoviesState> {
  GetPopularMoviesBloc(this._movieUsecases) : super(GetPopularMoviesInitial()) {
    on<FetchPopularMovies>(_onFetchPopularMovies);
  }

  /// The list of popular movie details.
  final List<MovieDetailEntity> _movieList = [];

  /// The current page number for fetching popular movies.
  int _page = 1;

  /// A flag indicating whether the maximum number of movies has been reached.
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
      (error) => emit(GetPopularMoviesError(message: error.message)),
      (success) {
        _page++;
        _movieList.addAll(
          success.movies?.where(_movieList.contains) ?? [],
        );

        if ((success.movies?.length ?? 0) < 20) {
          hasReachedMax = true;
        }
        emit(GetPopularMoviesLoaded(movies: List.of(_movieList)));
      },
    );
  }
}
