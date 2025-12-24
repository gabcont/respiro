
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
  final SharedPreferences _prefs;

  SPPreferencesRepositoryImpl(this._prefs);

  static const _kIsMuted = 'is_muted';
  static const _kIsCustomThemeEnabled = 'is_custom_theme_enabled';
  static const _kThemeMode = 'theme_mode';
  static const _kLastProfileSelected = 'last_profile_selected';
  static const _kIsFirstTime = 'is_first_time';

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    await _prefs.setInt(_kThemeMode, mode.index);
  }
  @override
  Future<ThemeMode> getThemeMode() async {
    // Si no existe, devolvemos ThemeMode.light (modo claro) por defecto
    return ThemeMode.values[_prefs.getInt(_kThemeMode) ?? 0];
  }

  @override
  Future<void> saveIsMuted(bool isMuted) async {
    await _prefs.setBool(_kIsMuted, isMuted);
  }
  
  @override
  Future<bool> getIsMuted() async {
    // Si no existe, devolvemos false (no silenciado) por defecto
    return _prefs.getBool(_kIsMuted) ?? false;
  }

  @override
  Future<void> saveLastProfileSelected(int profileId) async {
    await _prefs.setInt(_kLastProfileSelected, profileId);
  }

  @override
  Future<int?> getLastProfileSelected() async {
    return _prefs.getInt(_kLastProfileSelected);
  }

  @override
  Future<void> saveIsFirstTime(bool isFirstTime) async {
    await _prefs.setBool(_kIsFirstTime, isFirstTime);
  }

  @override
  Future<bool> getIsFirstTime() async {
    // Si no existe, devolvemos true (primera vez) por defecto
    return _prefs.getBool(_kIsFirstTime) ?? true;
  }
  
  @override
  Future<bool> getCustomThemeEnabled() async {
    return _prefs.getBool(_kIsCustomThemeEnabled) ?? false;
  }
  
  @override
  Future<void> saveCustomThemeEnabled(bool isEnabled) async {
    await _prefs.setBool(_kIsCustomThemeEnabled, isEnabled);
  }

}
