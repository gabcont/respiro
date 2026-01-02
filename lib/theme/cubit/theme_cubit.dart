import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:respiro/theme/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(ThemeMode initialThemeMode) : super(
    ThemeState(lightThemeData: RespiroTheme.lightTheme, darkThemeData: RespiroTheme.darkTheme, themeMode: initialThemeMode)
  );

  void updateThemeMode(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
  }

  void updateAccentColor(Color color) {
    if(color == state.accentColor) return;
    emit(state.copyWith(
      accentColor: color,
      lightThemeData: state.lightThemeData.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: color, brightness: Brightness.light),
      ),
      darkThemeData: state.darkThemeData.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: color, brightness: Brightness.dark),
      ),
    ));
  }

  void updateBreathingColors(BreathingColors colors) {
    if(colors == state.breathingColors) return;
    emit(state.copyWith(
      breathingColors: colors,
      lightThemeData: state.lightThemeData.copyWith(
        extensions: <ThemeExtension<dynamic>>[
          colors,
        ],
      ),
      darkThemeData: state.darkThemeData.copyWith(
        extensions: <ThemeExtension<dynamic>>[
          colors,
        ],
      ),
    ));
  }

  void updateThemeData(ThemeData light, ThemeData dark) {
    emit(state.copyWith(lightThemeData: light, darkThemeData: dark));
  }
}
