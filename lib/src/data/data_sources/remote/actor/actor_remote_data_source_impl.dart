import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/core/network/dio_client.dart';
import 'package:netflix_clone/src/data/data_sources/remote/actor/actor_remote_data_source.dart';
import 'package:netflix_clone/src/data/models/actor/actor_detail_model.dart';
import 'package:netflix_clone/src/data/models/actor/actor_social_media_model.dart';

@LazySingleton(as: ActorRemoteDataSource)
class ActorRemoteDataSourceImpl implements ActorRemoteDataSource {
  ActorRemoteDataSourceImpl(this._dioClient)
      : _deviceLocale = PlatformDispatcher.instance.locale.languageCode;

  final DioClient _dioClient;
  final String _deviceLocale;

  @override
  Future<ActorDetailModel> getActorDetail({
    required String actorId,
  }) async {
    return _dioClient.actorApiClient.getActorDetails(_deviceLocale, actorId);
  }

  @override
  Future<ActorSocialMediaModel> getActorSocialMedia({
    required String actorId,
  }) async {
    return _dioClient.actorApiClient.getActorSocialMedia(actorId);
  }
}
