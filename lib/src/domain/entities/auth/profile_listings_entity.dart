import 'package:equatable/equatable.dart';
import 'package:netflix_clone/src/domain/entities/auth/profile_details_entity.dart';

class ProfileListingsEntity extends Equatable {
  const ProfileListingsEntity({this.profiles});

  final List<ProfileDetailEntity>? profiles;

  @override
  List<Object?> get props => [profiles];
}
