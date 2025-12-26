enum Sounds{
  secondPassed,
  inhalePhaseStarted,
  exhalePhaseStarted,
  holdPhaseStarted,
}

abstract class SoundService {
  void loadAudioAsset(Sounds sound);
  void unloadAudioAsset(Sounds sound);
  void playSound(Sounds sound);
  void dispose();
}