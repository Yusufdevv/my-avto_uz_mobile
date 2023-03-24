part of 'theme_switcher_bloc.dart';

abstract class ThemeSwitcherEvent extends Equatable {
  const ThemeSwitcherEvent();
}

class SwitchThemeEvent extends ThemeSwitcherEvent {
  final ThemeMode themeMode;
  const SwitchThemeEvent({required this.themeMode});
  @override
  List<Object?> get props => [];
}
