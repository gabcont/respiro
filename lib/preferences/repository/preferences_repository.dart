import 'package:flutter/material.dart';

// Settings:
/*
  isMuted
  isCustomThemeEnabled
  themeMode
  lastProfileSelected
  isFirstTime
*/

abstract class PreferencesRepository {
  PreferencesRepository();

  Future<void> saveThemeMode(ThemeMode mode);

  Future<ThemeMode> getThemeMode();
  
  Future<void> saveIsMuted(bool isMuted);
  
  Future<bool> getIsMuted();

  Future<void> saveLastProfileSelected(int profileId);
  
  Future<int?> getLastProfileSelected();

  Future<void> saveIsFirstTime(bool isFirstTime);

  Future<bool> getIsFirstTime();

  Future<void> saveLocale(Locale locale);

  Future<Locale> getLocale();
}
