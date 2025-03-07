import 'package:netflix_clone/src/features/auth/data/model/profile_listings/profile_listings_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileListingsModel> getProfiles();

  Future<ProfileListingsModel> getSomething({
    required int page,
  });
}
