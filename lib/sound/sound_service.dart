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
  void dispose();
}