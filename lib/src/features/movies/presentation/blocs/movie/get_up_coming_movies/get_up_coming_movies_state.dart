part of 'get_up_coming_movies_bloc.dart';

sealed class GetUpComingMoviesState extends Equatable {
  const GetUpComingMoviesState();

  @override
  List<Object> get props => [];
}

final class GetUpComingMoviesInitial extends GetUpComingMoviesState {}

final class GetUpComingMoviesLoading extends GetUpComingMoviesState {
  const GetUpComingMoviesLoading();
}

final class GetUpComingMoviesLoaded extends GetUpComingMoviesState {
  const GetUpComingMoviesLoaded({required this.movies});

  final List<MovieDetailEntity> movies;

  @override
  List<Object> get props => [movies];
}

final class GetUpComingMoviesError extends GetUpComingMoviesState {
  const GetUpComingMoviesError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
