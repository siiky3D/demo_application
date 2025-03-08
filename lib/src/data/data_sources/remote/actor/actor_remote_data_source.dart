import 'package:netflix_clone/src/data/models/actor/actor_detail_model.dart';
import 'package:netflix_clone/src/data/models/actor/actor_social_media_model.dart';

abstract class ActorRemoteDataSource {
  Future<ActorDetailModel> getActorDetail({required String actorId});

  Future<ActorSocialMediaModel> getActorSocialMedia({required String actorId});
}
