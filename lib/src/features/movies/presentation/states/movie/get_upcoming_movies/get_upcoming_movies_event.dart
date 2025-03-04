part of 'get_upcoming_movies_bloc.dart';

sealed class GetUpComingMoviesEvent extends Equatable {
  const GetUpComingMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchUpComingMovies extends GetUpComingMoviesEvent {
  const FetchUpComingMovies();

  @override
  List<Object> get props => [];
}
