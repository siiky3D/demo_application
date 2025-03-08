part of 'movies_bloc.dart';

enum MovieStatus { initial, loading, success, failure }

final class MovieState extends Equatable {
  const MovieState({
    this.status = MovieStatus.initial,
    this.movies = const [],
    this.hasReachedMax = false,
    this.selectedMovieIndex = 0,
    this.page = 1,
    this.error,
  });

  final MovieStatus status;
  final List<MovieDetailEntity> movies;
  final bool hasReachedMax;
  final int selectedMovieIndex;
  final int page;
  final Exception? error;

  MovieState copyWith({
    MovieStatus? status,
    List<MovieDetailEntity>? movies,
    bool? hasReachedMax,
    int? selectedMovieIndex,
    int? page,
    Exception? error,
  }) {
    return MovieState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      selectedMovieIndex: selectedMovieIndex ?? this.selectedMovieIndex,
      page: page ?? this.page,
      error: error,
    );
  }

  MovieDetailEntity get selectedMovie => movies[selectedMovieIndex];

  @override
  String toString() {
    return '''Movies status: $status, hasReachedMax: $hasReachedMax, movies: ${movies.length}}''';
  }

  @override
  List<Object> get props => [
        status,
        movies,
        hasReachedMax,
        selectedMovieIndex,
        page,
      ];
}

// final class MoviesInitial extends MovieState {}

// final class MoviesLoading extends MovieState {
//   const MoviesLoading();
// }

// final class MoviesSuccess extends MovieState {
//   const MoviesSuccess({
//     required this.movies,
//     this.selectedMovieIndex = 0,
//   });

//   final List<MovieDetailEntity> movies;
//   final int selectedMovieIndex;

//   @override
//   List<Object> get props => [movies, selectedMovieIndex];

//   MovieDetailEntity get selectedMovie => movies[selectedMovieIndex];
// }

// final class MoviesLoadingMore extends MovieState {
//   const MoviesLoadingMore({
//     required this.movies,
//     this.canLoadMore = true,
//     this.page = 1,
//   });

//   final bool canLoadMore;
//   final int page;
//   final List<MovieDetailEntity> movies;

//   @override
//   List<Object> get props => [movies, canLoadMore, page];
// }

// final class MoviesFailure extends MovieState {
//   const MoviesFailure({required this.message});

//   final String message;

//   @override
//   List<Object> get props => [message];
// }
