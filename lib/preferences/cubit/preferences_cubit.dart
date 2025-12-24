import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:respiro/preferences/preferences.dart';
import 'package:respiro/profiles/profiles.dart';


part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  
  final ProfilesRepository profilesRepository;
  final PreferencesRepository preferencesRepository;

  PreferencesCubit({
    required this.profilesRepository,
    required this.preferencesRepository,
  }) : super(PreferencesState()) {
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    final isMuted = await preferencesRepository.getIsMuted();
    final customThemeEnabled = await preferencesRepository.getCustomThemeEnabled();
    final themeMode = await preferencesRepository.getThemeMode();
    
    emit(state.copyWith(
      isMuted: isMuted,
      customThemeEnabled: customThemeEnabled,
      themeMode: themeMode,
    ));
  }

  void onCustomThemeEnabled() {
    preferencesRepository.saveCustomThemeEnabled(true);
    emit(state.copyWith(
      customThemeEnabled: true,
    ));
  }

  void onCustomThemeDisabled() {
    preferencesRepository.saveCustomThemeEnabled(false);
    emit(state.copyWith(
      customThemeEnabled: false,
    ));
  }

  void onDarkModeSelected() {
    preferencesRepository.saveThemeMode(ThemeMode.dark);
    emit(state.copyWith(themeMode: ThemeMode.dark));
  }

  void onLightModeSelected() {
    preferencesRepository.saveThemeMode(ThemeMode.light);
    emit(state.copyWith(themeMode: ThemeMode.light));
  }

  void onMutedToggled() {
    preferencesRepository.saveIsMuted(!state.isMuted);
    emit(state.copyWith(isMuted: !state.isMuted));
  }

  Future<void> onResetToDefaults() async {
    await preferencesRepository.saveLastProfileSelected(0);
    await preferencesRepository.saveIsFirstTime(true); 
    await profilesRepository.deleteAllProfiles();
    await profilesRepository.loadInitialValues();
  }

}
