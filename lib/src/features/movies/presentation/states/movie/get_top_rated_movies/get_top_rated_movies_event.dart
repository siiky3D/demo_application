part of 'get_top_rated_movies_bloc.dart';

sealed class GetTopRatedMoviesEvent extends Equatable {
  const GetTopRatedMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchTopRatedMovies extends GetTopRatedMoviesEvent {
  const FetchTopRatedMovies();

  @override
  List<Object> get props => [];
}
