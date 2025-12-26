import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:respiro/preferences/repository/preferences_repository.dart';
import 'package:respiro/sound/sound_service.dart';

part 'session_audio_state.dart';

class SessionAudioCubit extends Cubit<SessionAudioState> {
  
  final SoundService soundService;
  final PreferencesRepository preferencesRepository;
  
  SessionAudioCubit({
    required this.soundService,
    required this.preferencesRepository,
  }) : super(SessionAudioState(isSoundDisabled: soundService.isSoundMuted));
  

  void toggleSound() {
    final isMuted = soundService.isSoundMuted;
    isMuted ? soundService.unmuteSound() : soundService.muteSound();
    emit(SessionAudioState(isSoundDisabled: !isMuted));
  }

  void setVolume(double volume) {
    soundService.setVolume(volume);
  }

  @override
  Future<void> close() async {
    await preferencesRepository.saveIsMuted(soundService.isSoundMuted);
    soundService.dispose();
    return super.close();
  }
}
