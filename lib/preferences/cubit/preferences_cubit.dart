import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:respiro/l10n/locales.dart';
import 'package:respiro/preferences/preferences.dart';
import 'package:respiro/routines/routines.dart';
import 'package:respiro/sound/sound_service.dart';


part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  
  final RoutinesRepository profilesRepository;
  final PreferencesRepository preferencesRepository;
  final SoundService soundService;

  PreferencesCubit({
    required this.profilesRepository,
    required this.preferencesRepository,
    required this.soundService,
  }) : super(PreferencesState()) {
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    final isMuted = await preferencesRepository.getIsMuted();
    final themeMode = await preferencesRepository.getThemeMode();
    
    emit(state.copyWith(
      isMuted: isMuted,
      themeMode: themeMode,
    ));
  }

  void onThemeModeChanged(ThemeMode mode) {
    preferencesRepository.saveThemeMode(mode);
    emit(state.copyWith(themeMode: mode));
  }

  void onMutedToggled() {
    if(state.isMuted) {
      soundService.unmuteSound();
    }
    else {
      soundService.muteSound();
    }
    preferencesRepository.saveIsMuted(!state.isMuted);
    emit(state.copyWith(isMuted: !state.isMuted));
  }

  void onLocaleChanged(Locale locale) {
    preferencesRepository.saveLocale(locale);
    emit(state.copyWith(locale: locale));
  }

  Future<void> onResetToDefaults() async {
    await preferencesRepository.saveLastProfileSelected(0);
    await preferencesRepository.saveIsFirstTime(true); 
    await profilesRepository.deleteAllRoutines();
    await profilesRepository.loadDefaultValues();
  }

}
