part of 'theme_switcher_bloc.dart';

class ThemeSwitcherState extends Equatable {
  final ThemeMode themeMode;

  ThemeSwitcherState copyWith(ThemeMode themeMode) =>
      ThemeSwitcherState(themeMode);

  const ThemeSwitcherState(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}
