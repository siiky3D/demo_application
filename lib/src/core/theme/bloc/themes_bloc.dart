import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/core/theme/themes.dart';
import 'package:netflix_clone/src/core/theme/themes/themes.dark.dart';
import 'package:netflix_clone/src/core/theme/themes/themes.light.dart';

part 'themes_event.dart';
part 'themes_state.dart';

@lazySingleton
class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {
  ThemesBloc() : super(const ThemesInitial()) {
    on<ThemesEventChanged>(_onThemeChanged);
  }

  Future<void> _onThemeChanged(
    ThemesEventChanged event,
    Emitter<ThemesState> emit,
  ) async {
    emit(const ThemesDark());
  }
}
