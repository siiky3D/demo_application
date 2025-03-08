import 'package:dio/dio.dart';
import 'package:netflix_clone/src/data/models/actor/actor_detail_model.dart';
import 'package:netflix_clone/src/data/models/actor/actor_social_media_model.dart';
import 'package:retrofit/retrofit.dart';

part 'actort_api.g.dart';

@RestApi(baseUrl: '/person')
abstract class ActorApi {
  factory ActorApi(Dio dio, {String? baseUrl}) = _ActorApi;

  @GET('/{person_id}')
  Future<ActorDetailModel> getActorDetails(
    @Query('language') String? language,
    @Path('person_id') String actorId,
  );

  @GET('/{person_id}/external_ids')
  Future<ActorSocialMediaModel> getActorSocialMedia(
    @Path('person_id') String actorId,
  );
}
