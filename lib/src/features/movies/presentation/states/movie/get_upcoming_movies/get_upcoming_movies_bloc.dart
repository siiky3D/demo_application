import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/usecases/movie/movie_usecases.dart';

part 'get_upcoming_movies_event.dart';
part 'get_upcoming_movies_state.dart';

@lazySingleton
class GetUpComingMoviesBloc
    extends Bloc<GetUpComingMoviesEvent, GetUpComingMoviesState> {
  GetUpComingMoviesBloc(this._movieUsecases)
      : super(GetUpComingMoviesInitial()) {
    on<FetchUpComingMovies>(_onFetchUpComingMovies);
  }

  final List<MovieDetailEntity> _movieList = [];

  int _page = 1;

  bool hasReachedMax = false;

  final MovieUsecases _movieUsecases;

  Future<void> _onFetchUpComingMovies(
    FetchUpComingMovies event,
    Emitter<GetUpComingMoviesState> emit,
  ) async {
    try {
      if (hasReachedMax) return;

      if (state is! GetUpComingMoviesLoaded) {
        emit(const GetUpComingMoviesLoading());
      }

      final result = await _movieUsecases.getUpcomingMovies(page: _page);

      result.fold(
        (error) => emit(GetUpComingMoviesError(message: error.message)),
        (success) {
          _page++;
          _movieList.addAll(
            success.movies
                    ?.where((movie) => _movieList.contains(movie) == false) ??
                [],
          );

          if (success.movies == null || success.movies!.isEmpty) {
            hasReachedMax = true;
          }

          emit(GetUpComingMoviesLoaded(movies: _movieList));
        },
      );
    } catch (e) {
      emit(GetUpComingMoviesError(message: e.toString()));
    }
  }
}
