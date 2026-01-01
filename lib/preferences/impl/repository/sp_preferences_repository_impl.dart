
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:respiro/preferences/repository/preferences_repository.dart';

// Settings:
/*
  isMuted
  isCustomThemeEnabled
  themeMode
  lastProfileSelected
  isFirstTime
*/

class SPPreferencesRepositoryImpl implements PreferencesRepository {
  
  final SharedPreferences preferencesRepository;

  SPPreferencesRepositoryImpl({required this.preferencesRepository});

  static const _kIsMuted = 'is_muted';
  static const _kThemeMode = 'theme_mode';
  static const _kLastProfileSelected = 'last_profile_selected';
  static const _kIsFirstTime = 'is_first_time';
  static const _kLocale = 'locale';

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    await preferencesRepository.setInt(_kThemeMode, mode.index);
  }
  @override
  Future<ThemeMode> getThemeMode() async {
    // Si no existe, devolvemos ThemeMode.light (modo claro) por defecto
    return ThemeMode.values[preferencesRepository.getInt(_kThemeMode) ?? 0];
  }

  @override
  Future<void> saveIsMuted(bool isMuted) async {
    await preferencesRepository.setBool(_kIsMuted, isMuted);
  }
  
  @override
  Future<bool> getIsMuted() async {
    // Si no existe, devolvemos false (no silenciado) por defecto
    return preferencesRepository.getBool(_kIsMuted) ?? false;
  }

  @override
  Future<void> saveLastProfileSelected(int profileId) async {
    await preferencesRepository.setInt(_kLastProfileSelected, profileId);
  }

  @override
  Future<int?> getLastProfileSelected() async {
    return preferencesRepository.getInt(_kLastProfileSelected);
  }

  @override
  Future<void> saveIsFirstTime(bool isFirstTime) async {
    await preferencesRepository.setBool(_kIsFirstTime, isFirstTime);
  }

  @override
  Future<bool> getIsFirstTime() async {
    // Si no existe, devolvemos true (primera vez) por defecto
    return preferencesRepository.getBool(_kIsFirstTime) ?? true;
  }

  @override
  Future<void> saveLocale(Locale locale) async {
    await preferencesRepository.setString(_kLocale, locale.languageCode);
  }
  @override
  Future<Locale> getLocale() async {
    return Locale(
      preferencesRepository.getString(_kLocale) ?? 'en',
    );
  }


}
