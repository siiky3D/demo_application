part of 'profiles_bloc.dart';

sealed class ProfilesEvent extends Equatable {
  const ProfilesEvent();

  @override
  List<Object> get props => [];
}

class ProfilesLoadStarted extends ProfilesEvent {}

class ProfilesSelectedChange extends ProfilesEvent {
  const ProfilesSelectedChange({required this.profileId});

  final int profileId;

  @override
  List<Object> get props => [profileId];
}
