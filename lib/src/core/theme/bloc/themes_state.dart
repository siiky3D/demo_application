part of 'themes_bloc.dart';

sealed class ThemesState extends Equatable {
  const ThemesState();

  @override
  List<Object> get props => [];
}

final class ThemesInitial extends ThemesState {
  const ThemesInitial({this.theme = const DarkAppTheme()});
  final AppTheme theme;

  @override
  List<Object> get props => [theme];
}

final class ThemesDark extends ThemesState {
  const ThemesDark({this.theme = const DarkAppTheme()});
  final AppTheme theme;

  @override
  List<Object> get props => [theme];
}

final class ThemesLight extends ThemesState {
  const ThemesLight({this.theme = const LightAppTheme()});
  final AppTheme theme;

  @override
  List<Object> get props => [theme];
}
