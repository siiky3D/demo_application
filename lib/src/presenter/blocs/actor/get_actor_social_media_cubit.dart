import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/domain/entities/actor/actor_social_medias_entity.dart';
import 'package:netflix_clone/src/domain/usecases/actor/actor_usecases.dart';

part 'get_actor_social_media_state.dart';

class GetActorSocialMediaCubit extends Cubit<GetActorSocialMediaState> {
  GetActorSocialMediaCubit(this._actorUsecases)
      : super(GetActorSocialMediaInitial());

  Future<void> getActorSocialMedia({required String actorId}) async {
    try {
      emit(const GetActorSocialMediaLoading());

      final result = await _actorUsecases.getActorSocialMedia(actorId: actorId);

      result.fold(
        (error) => emit(GetActorSocialMediaError(message: error.message)),
        (success) => emit(GetActorSocialMediaLoaded(data: success)),
      );
    } catch (_) {
      rethrow;
    }
  }

  final ActorUsecases _actorUsecases;
}
