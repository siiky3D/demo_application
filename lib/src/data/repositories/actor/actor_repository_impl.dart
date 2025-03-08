import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
import 'package:netflix_clone/src/data/data_sources/remote/actor/actor_remote_data_source.dart';
import 'package:netflix_clone/src/domain/entities/actor/actor_detail_entity.dart';
import 'package:netflix_clone/src/domain/entities/actor/actor_social_medias_entity.dart';
import 'package:netflix_clone/src/domain/repositories/actor/actor_repository.dart';

@LazySingleton(as: ActorRepository)
class ActorRepositoryImpl implements ActorRepository {
  ActorRepositoryImpl(this._actorRemoteDataSource);
  final ActorRemoteDataSource _actorRemoteDataSource;

  @override
  Future<Either<NetworkException, ActorDetailEntity>> getActorDetail({
    required String actorId,
  }) async {
    try {
      final result =
          await _actorRemoteDataSource.getActorDetail(actorId: actorId);

      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({
    required String actorId,
  }) async {
    try {
      final result =
          await _actorRemoteDataSource.getActorSocialMedia(actorId: actorId);

      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }
}
