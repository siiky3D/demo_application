part of 'now_playing_movies_bloc.dart';

sealed class GetNowPlayingMoviesState extends Equatable {
  const GetNowPlayingMoviesState();

  @override
  List<Object> get props => [];
}

final class GetNowPlayingMoviesInitial extends GetNowPlayingMoviesState {}
