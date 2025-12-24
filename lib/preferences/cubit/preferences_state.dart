part of 'preferences_cubit.dart';

class PreferencesState extends Equatable {
  const PreferencesState({
    this.customThemeEnabled = false,
    this.themeMode = ThemeMode.light,
    this.isMuted = false, 
  });

  final bool customThemeEnabled;
  final ThemeMode themeMode;
  final bool isMuted;

  PreferencesState copyWith({
    bool? customThemeEnabled,
    ThemeMode? themeMode,
    bool? isMuted,
  }) {
    return PreferencesState(
      customThemeEnabled: customThemeEnabled ?? this.customThemeEnabled,
      themeMode: themeMode ?? this.themeMode,
      isMuted: isMuted ?? this.isMuted,
    );
  }
  
  @override
  List<Object> get props => [customThemeEnabled, themeMode, isMuted];
}