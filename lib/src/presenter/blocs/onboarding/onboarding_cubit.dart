import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/data/repositories/onboarding/onboarding_repository.dart';

@lazySingleton
class OnboardingCubit extends Cubit<bool> {
  OnboardingCubit(this._onboardingRepository) : super(false);
  final OnboardingRepository _onboardingRepository;

  Future<void> checkOnboardingComplete() async {
    final isComplete = _onboardingRepository.isOnboardingComplete();
    emit(isComplete);
  }

  Future<void> completeOnboarding() async {
    await _onboardingRepository.setOnboardingComplete();
    emit(true);
  }
}
