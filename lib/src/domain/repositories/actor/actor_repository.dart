import 'package:fpdart/fpdart.dart';
import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
import 'package:netflix_clone/src/domain/entities/actor/actor_detail_entity.dart';
import 'package:netflix_clone/src/domain/entities/actor/actor_social_medias_entity.dart';

abstract class ActorRepository {
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail({
    required String actorId,
  });

  Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({
    required String actorId,
  });
}
