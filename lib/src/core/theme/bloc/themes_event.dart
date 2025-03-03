part of 'themes_bloc.dart';

sealed class ThemesEvent extends Equatable {
  const ThemesEvent();

  @override
  List<Object> get props => [];
}

class ThemesEventChanged extends ThemesEvent {
  const ThemesEventChanged(this.theme);
  final AppTheme theme;
}
