import 'package:auto/assets/constants/storage_keys.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_switcher_event.dart';

part 'theme_switcher_state.dart';

class ThemeSwitcherBloc extends Bloc<ThemeSwitcherEvent, ThemeSwitcherState> {
  ThemeSwitcherBloc() : super(ThemeSwitcherState(MyFunctions.getThemeMode())) {
    on<SwitchThemeEvent>((event, emit) async {
      emit(state.copyWith(event.themeMode));
      switch (event.themeMode) {
        case ThemeMode.system:
          await StorageRepository.putString(StorageKeys.THEME_MODE, 'system');
          break;
        case ThemeMode.light:
          await StorageRepository.putString(StorageKeys.THEME_MODE, 'light');
          break;
        case ThemeMode.dark:
          await StorageRepository.putString(StorageKeys.THEME_MODE, 'dark');
          break;
      }
    });
  }
}
