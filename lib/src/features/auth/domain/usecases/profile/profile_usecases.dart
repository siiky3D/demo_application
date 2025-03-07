import 'package:fpdart/fpdart.dart';
import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
import 'package:netflix_clone/src/features/auth/domain/entities/export_entities.dart';

abstract class ProfileUsecases {
  // Future<Either<void, ProfileDetailEntity>> getProfiles();
  Future<Either<NetworkException, List<ProfileDetailEntity>>> getProfiles();
  Future<Either<NetworkException, ProfileDetailEntity>> getSomething();
}
