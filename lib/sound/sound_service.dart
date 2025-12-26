enum Sounds{
  secondPassed,
  inhalePhaseStarted,
  exhalePhaseStarted,
  holdPhaseStarted,
}

abstract class SoundService {

  void muteSound();
  void unmuteSound();
  Future<void> loadAudioAsset(Sounds sound);
  Future<void> unloadAudioAsset(Sounds sound);
  Future<void> playSound(Sounds sound);
  bool get isSoundMuted;
  double get currentVolume;
  void setVolume(double volume);
  void dispose();
}