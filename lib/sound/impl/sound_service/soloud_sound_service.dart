import 'package:respiro/sound/sound_service.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

class SoloudSoundService implements SoundService {

  final SoLoud soloud;
  late Map<Sounds, AudioSource> _sources;
  late 
  bool isMuted;

  SoloudSoundService(
    {
      required this.soloud,
      this.isMuted = false,
    }
  ) {
    _sources = {};
  }

  @override
  void muteSound() {
    isMuted = true;
  }

  @override
  void unmuteSound() {
    isMuted = false;
  }

  @override
  Future<void> loadAudioAsset(Sounds sound) async {
    if(!_sources.containsKey(sound)) {  
      String assetPath;
      switch (sound) {
        case Sounds.secondPassed:
          assetPath = 'assets/sounds/tick1.mp3';
          break;
        case Sounds.inhalePhaseStarted:
          assetPath = 'assets/sounds/phase1.mp3';
          break;
        case Sounds.exhalePhaseStarted:
          assetPath = 'assets/sounds/phase3.mp3';
          break;
        case Sounds.holdPhaseStarted:
          assetPath = 'assets/sounds/phase2.mp3';
          break;
      }
      final AudioSource source =  await soloud.loadAsset(assetPath);
      _sources[sound] = source;
    }
    else {
      print('Sonido ya cargado');
    }

  }

  @override
  Future<void> unloadAudioAsset(Sounds sound) async {
    //await _sources[sound]?.dispose();
    _sources.remove(sound);
  }

  @override
  Future<void> playSound(Sounds sound) async {
    if(!isMuted && _sources.containsKey(sound)) {
      //await _sources[sound]?.stop();
      await soloud.play(_sources[sound]!);
      print('reproduciendo ${sound}');
    }
    else {
      print('Tratando de reproducir audio no cargado: ${sound}');
    }
  }

  @override
  void dispose() {
    _sources.forEach((key, source) async {
      //await source.dispose();
    });
    _sources.clear();
  }
}