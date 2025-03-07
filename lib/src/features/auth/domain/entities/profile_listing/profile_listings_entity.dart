import 'package:equatable/equatable.dart';
import 'package:netflix_clone/src/features/auth/domain/entities/export_entities.dart';

class ProfileListingsEntity extends Equatable {
  const ProfileListingsEntity({this.profiles});

  final List<ProfileDetailEntity>? profiles;

  @override
  List<Object?> get props => [profiles];
}
