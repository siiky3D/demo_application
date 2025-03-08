import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
import 'package:netflix_clone/src/domain/entities/actor/actor_detail_entity.dart';
import 'package:netflix_clone/src/domain/entities/actor/actor_social_medias_entity.dart';
import 'package:netflix_clone/src/domain/repositories/actor/actor_repository.dart';

@lazySingleton
class ActorUsecases {
  const ActorUsecases(this._actorRepository);
  final ActorRepository _actorRepository;

  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail({
    required String actorId,
  }) async {
    return _actorRepository.getActorDetail(actorId: actorId);
  }

  Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({
    required String actorId,
  }) async {
    return _actorRepository.getActorSocialMedia(actorId: actorId);
  }
}
