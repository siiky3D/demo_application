part of 'profiles_bloc.dart';

enum ProfilesStatus { initial, loading, success, failure }

final class ProfilesState extends Equatable {
  const ProfilesState({
    this.status = ProfilesStatus.initial,
    this.profiles = const [],
    this.selectedProfileIndex = 0,
    this.error,
  });

  final ProfilesStatus status;
  final List<ProfileDetailEntity> profiles;
  final int selectedProfileIndex;
  final Exception? error;

  ProfileDetailEntity get selectedProfile => profiles[selectedProfileIndex];

  bool get hasSelectedProfile =>
      profiles.isNotEmpty && selectedProfileIndex >= 0;

  ProfilesState copyWith({
    ProfilesStatus? status,
    List<ProfileDetailEntity>? profiles,
    int? selectedProfileIndex,
    Exception? error,
  }) {
    return ProfilesState(
      status: status ?? this.status,
      profiles: profiles ?? this.profiles,
      selectedProfileIndex: selectedProfileIndex ?? this.selectedProfileIndex,
      error: error,
    );
  }

  @override
  List<Object> get props => [status, profiles, selectedProfileIndex];
}
