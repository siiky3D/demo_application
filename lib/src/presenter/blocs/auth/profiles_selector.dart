// ignore_for_file: avoid_positional_boolean_parameters

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/src/domain/entities/auth/profile_details_entity.dart';
import 'package:netflix_clone/src/presenter/blocs/auth/profiles_bloc.dart';

class ProfilesSelector<T> extends BlocSelector<ProfilesBloc, ProfilesState, T> {
  ProfilesSelector({
    required super.selector,
    required Widget Function(T) builder,
    super.key,
  }) : super(builder: (_, value) => builder(value));
}

class ProfilesStateStatusSelector extends ProfilesSelector<ProfilesStatus> {
  ProfilesStateStatusSelector(
    Widget Function(ProfilesStatus) builder, {
    super.key,
  }) : super(
          selector: (state) => state.status,
          builder: builder,
        );
}

class NumberOfProfilesSelector extends ProfilesSelector<int> {
  NumberOfProfilesSelector(Widget Function(int) builder, {super.key})
      : super(
          selector: (state) => state.profiles.length,
          builder: builder,
        );
}

class CurrentProfilesSelector extends ProfilesSelector<ProfileDetailEntity> {
  CurrentProfilesSelector(
    Widget Function(ProfileDetailEntity) builder, {
    super.key,
  }) : super(
          selector: (state) => state.selectedProfile,
          builder: builder,
        );
}

class ProfileSelector extends ProfilesSelector<ProfileSelectorState> {
  ProfileSelector(
    int index,
    Widget Function(ProfileDetailEntity, bool) builder, {
    super.key,
  }) : super(
          selector: (state) {
            final isValidIndex = index >= 0 && index < state.profiles.length;

            return ProfileSelectorState(
              profile: isValidIndex
                  ? state.profiles[index]
                  : const ProfileDetailEntity(),
              selected: isValidIndex && state.selectedProfileIndex == index,
            );
          },
          builder: (value) => builder(value.profile, value.selected),
        );
}

class ProfileSelectorState extends Equatable {
  const ProfileSelectorState({
    required this.profile,
    this.selected = false,
  });

  final ProfileDetailEntity profile;
  final bool selected;

  ProfileSelectorState copyWith({
    ProfileDetailEntity? profile,
    bool? selected,
  }) {
    return ProfileSelectorState(
      profile: profile ?? this.profile,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object> get props => [profile, selected];
}
