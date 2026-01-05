part of 'preferences_cubit.dart';

class PreferencesState extends Equatable {
  PreferencesState({
    this.locale = RespiroLocales.localeEn,
    this.themeMode = ThemeMode.light,
    this.isMuted = false, 
  });

  final Locale locale;
  final ThemeMode themeMode;
  final bool isMuted;

  PreferencesState copyWith({
    Locale? locale,
    bool? customThemeEnabled,
    ThemeMode? themeMode,
    bool? isMuted,
  }) {
    return PreferencesState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      isMuted: isMuted ?? this.isMuted,
    );
  }
  
  @override
  List<Object> get props => [locale, themeMode, isMuted];
}