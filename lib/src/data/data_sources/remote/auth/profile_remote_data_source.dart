import 'package:netflix_clone/src/data/models/auth/profile_listings_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileListingsModel> getProfiles();

  Future<ProfileListingsModel> getSomething({
    required int page,
  });
}
