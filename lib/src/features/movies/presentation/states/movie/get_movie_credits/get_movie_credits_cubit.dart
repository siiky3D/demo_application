import 'package:demo_app_temp/src/features/movies/domain/entities/movie_credit/movie_credit_entity.dart';
import 'package:demo_app_temp/src/features/movies/domain/usecases/movie/movie_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_movie_credits_state.dart';

class GetMovieCreditsCubit extends Cubit<GetMovieCreditsState> {
  GetMovieCreditsCubit(this._movieUsecases)
      : super(const GetMovieCreditsInitial());

  Future<void> getMovieCredits(int movieId) async {
    emit(const GetMovieCreditsLoading());

    final result = await _movieUsecases.getMovieCredits(movieId: movieId);

    result.fold(
      (error) => emit(GetMovieCreditsError(error.message)),
      (movieCreditEntity) => emit(GetMovieCreditsLoaded(movieCreditEntity)),
    );
  }

  final MovieUsecases _movieUsecases;
}
