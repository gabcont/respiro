part of 'preferences_cubit.dart';

class PreferencesState extends Equatable {
  PreferencesState({
    this.locale = RespiroLocales.localeEn,
    this.customThemeEnabled = false,
    this.themeMode = ThemeMode.light,
    this.isMuted = false, 
  });

  final Locale locale;
  final bool customThemeEnabled;
  final ThemeMode themeMode;
  final bool isMuted;

  // DUDA: ¿Es necesario cambiar esto?
  final List<Locale> availableLocales = RespiroLocales().supportedLocales;

  PreferencesState copyWith({
    Locale? locale,
    bool? customThemeEnabled,
    ThemeMode? themeMode,
    bool? isMuted,
  }) {
    return PreferencesState(
      locale: locale ?? this.locale,
      customThemeEnabled: customThemeEnabled ?? this.customThemeEnabled,
      themeMode: themeMode ?? this.themeMode,
      isMuted: isMuted ?? this.isMuted,
    );
  }
  
  @override
  List<Object> get props => [locale, customThemeEnabled, themeMode, isMuted];
}