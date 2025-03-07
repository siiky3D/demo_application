import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/features/auth/domain/entities/export_entities.dart';
import 'package:netflix_clone/src/features/auth/domain/usecases/profile/profile_usecases.dart';
import 'package:stream_transform/stream_transform.dart';

part 'profiles_event.dart';
part 'profiles_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@lazySingleton
class ProfilesBloc extends Bloc<ProfilesEvent, ProfilesState> {
  ProfilesBloc(this._profileUsecases) : super(const ProfilesState()) {
    on<ProfilesLoadStarted>(
      _onLoadStarted,
      transformer: throttleDroppable(throttleDuration),
    );

    on<ProfilesSelectedChange>(_onSelectChanged);
  }

  final ProfileUsecases _profileUsecases;

  Future<void> _onLoadStarted(
    ProfilesLoadStarted event,
    Emitter<ProfilesState> emit,
  ) async {
    if (state.status != ProfilesStatus.success) {
      emit(state.copyWith(status: ProfilesStatus.loading));
    }

    final results = await _profileUsecases.getProfiles();

    results.fold(
      (error) {
        emit(state.copyWith(status: ProfilesStatus.failure));
      },
      (success) {
        emit(
          state.copyWith(
            status: ProfilesStatus.success,
            profiles: success,
          ),
        );
      },
    );
  }

  void _onSelectChanged(
    ProfilesSelectedChange event,
    Emitter<ProfilesState> emit,
  ) {
    final profileIndex = state.profiles.indexWhere(
      (profile) => profile.id == event.profileId,
    );

    if (profileIndex == 0 || profileIndex >= state.profiles.length) return;
    final selectedProfile = state.profiles[profileIndex];
    emit(
      state.copyWith(
        profiles: [...state.profiles]..setAll(profileIndex, [selectedProfile]),
        selectedProfileIndex: profileIndex,
      ),
    );
  }
}
