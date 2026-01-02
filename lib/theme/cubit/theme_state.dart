part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  
  final BreathingColors breathingColors;
  final Color accentColor;
  final ThemeData lightThemeData;
  final ThemeData darkThemeData;
  final ThemeMode themeMode;
  
  ThemeState({
    this.breathingColors = BreathingColors.light,
    this.accentColor = Colors.lightBlue,
    required this.lightThemeData,
    required this.darkThemeData,
    this.themeMode = ThemeMode.system,
  });

  ThemeState copyWith({
    BreathingColors? breathingColors,
    Color? accentColor,
    ThemeData? lightThemeData,
    ThemeData? darkThemeData,
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      breathingColors: breathingColors ?? this.breathingColors,
      accentColor:  accentColor ?? this.accentColor,
      lightThemeData: lightThemeData ?? this.lightThemeData,
      darkThemeData: darkThemeData ?? this.darkThemeData,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object> get props => [
    breathingColors,
    accentColor,
    lightThemeData,
    darkThemeData,
    themeMode,
  ];
}