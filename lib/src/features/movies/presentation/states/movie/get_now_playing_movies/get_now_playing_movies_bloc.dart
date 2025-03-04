import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'get_now_playing_movies_event.dart';
part 'get_now_playing_movies_state.dart';

@lazySingleton
class GetNowPlayingMoviesBloc
    extends Bloc<GetNowPlayingMoviesEvent, GetNowPlayingMoviesState> {
  GetNowPlayingMoviesBloc() : super(GetNowPlayingMoviesInitial()) {
    on<GetNowPlayingMoviesEvent>((event, emit) {});
  }
}
