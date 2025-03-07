import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/core/network/dio_client.dart';
import 'package:netflix_clone/src/features/auth/data/data_sources/remote/profile_remote_data_source.dart';
import 'package:netflix_clone/src/features/auth/data/model/profile_listings/profile_listings_model.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl(this._dioClient);
  final DioClient _dioClient;

  @override
  Future<ProfileListingsModel> getProfiles() {
    throw UnimplementedError();
  }

  @override
  Future<ProfileListingsModel> getSomething({required int page}) {
    throw UnimplementedError();
  }
}
