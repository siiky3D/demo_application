import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/features/auth/data/profile_managements.dart';

@lazySingleton
class ProfileSelectionCubit extends Cubit<List<String>> {
  ProfileSelectionCubit() : super([profiles[0].image, profiles[0].name]);

  void updateProfile(String image, String name) {
    emit([image, name]);
  }
}
