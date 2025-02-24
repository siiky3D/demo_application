import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_now_playing_movies_event.dart';
part 'get_now_playing_movies_state.dart';

class GetNowPlayingMoviesBloc extends Bloc<GetNowPlayingMoviesEvent, GetNowPlayingMoviesState> {
  GetNowPlayingMoviesBloc() : super(GetNowPlayingMoviesInitial()) {
    on<GetNowPlayingMoviesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
