import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/core/config/constants/const.dart';
import 'package:netflix_clone/src/core/exceptions/network/network_exception.dart';
import 'package:netflix_clone/src/domain/entities/auth/profile_details_entity.dart';
import 'package:netflix_clone/src/domain/usecases/auth/profile_usecases.dart';

@LazySingleton(as: ProfileUsecases)
class ProfileUsecasesImpl extends ProfileUsecases {
  @override
  Future<Either<NetworkException, List<ProfileDetailEntity>>>
      getProfiles() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const Right(profiles);
  }

  @override
  Future<Either<NetworkException, ProfileDetailEntity>> getSomething() {
    throw UnimplementedError();
  }
}
