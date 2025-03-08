import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/domain/entities/actor/actor_detail_entity.dart';
import 'package:netflix_clone/src/domain/usecases/actor/actor_usecases.dart';

part 'get_actor_detail_state.dart';

class GetActorDetailCubit extends Cubit<GetActorDetailState> {
  GetActorDetailCubit(this._actorUsecases) : super(GetActorDetailInitial());

  Future<void> getActorDetail({required String actorId}) async {
    try {
      emit(const GetActorDetailLoading());

      final result = await _actorUsecases.getActorDetail(actorId: actorId);

      result.fold(
        (error) => emit(GetActorDetailError(message: error.message)),
        (success) => emit(GetActorDetailLoaded(actor: success)),
      );
    } catch (_) {
      rethrow;
    }
  }

  final ActorUsecases _actorUsecases;
}
