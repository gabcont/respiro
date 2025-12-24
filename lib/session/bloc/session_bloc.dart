import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:respiro/app/navigation_service/navigation_service.dart';

import 'package:respiro/preferences/preferences.dart';
import 'package:respiro/profiles/profiles.dart';
import 'package:respiro/session/session.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {

  final NavigationService navigationService;
  final PreferencesRepository preferencesRepository;
  final SessionTimerService timer;
  AudioPlayer? _tickPlayer;
  AudioPlayer? _phasePlayer;
  bool _audioDisabled = false;
  StreamSubscription? _streamSubscription;

  SessionBloc({
    required this.preferencesRepository, 
    required BreathingProfile profile, 
    required Duration sessionDuration, 
    required this.timer,
    required this.navigationService,
  }) 
  : super(SessionState(
    profile: profile,
    currentStep: profile.steps.isNotEmpty ? profile.steps[0] : BreathingStep(),
  )) {
    
    on<SessionStarted>((event, emit) async {
      // Pre-initialize players to reduce latency
      _tickPlayer ??= AudioPlayer()..setPlayerMode(PlayerMode.lowLatency);
      // Use mediaPlayer for phases to avoid decoding issues with larger files
      _phasePlayer ??= AudioPlayer()..setPlayerMode(PlayerMode.mediaPlayer);
      
      await _tickPlayer!.setVolume(0.5);
      // Pre-load tick sound
      await _tickPlayer!.setSource(AssetSource('sounds/tick1.mp3'));

      // Iniciar el temporizador
      timer.start(Duration(seconds: 1));

      // Cancel any existing subscription
      _streamSubscription?.cancel();

      // Subscribe to the timer stream
      _streamSubscription = timer.timerStream.listen((duration) {
        add(TimerTicked(elapsedTime: duration));
      });

      // Get shared preferences
      _audioDisabled = await preferencesRepository.getIsMuted();

      // Emitir el estado inicial del sesión
      emit(state.copyWith(
        status: SessionStatus.stepChanged,
        profile: event.profile,
        sessionDuration: event.sessionDuration,
        elapsedTime: Duration.zero,
        currentStep: event.profile.steps.isNotEmpty ? event.profile.steps[0] : BreathingStep(),
      ));
    });

    on<SessionPaused>((event, emit) {
      emit(state.copyWith(
        status: SessionStatus.paused,
      ));
      timer.pause();
    });

    on<SessionResumed>((event, emit) {
      emit(state.copyWith(status: SessionStatus.resumed));
      timer.resume();
    });

    on<SessionReset>((event, emit) {
      timer.stop();
      timer.start(Duration(seconds: 1));
      emit(state.copyWith(
        status: SessionStatus.reseted,
        elapsedTime: Duration.zero,
        elapsedTimeSinceLastStep: Duration.zero,
        currentStep: state.profile.steps.isNotEmpty ? state.profile.steps[0] : BreathingStep(),
      ));
    });

    on<SessionCanceled>((event, emit) {
      emit(state.copyWith(status: SessionStatus.canceled));
      navigationService.goBack();
    });

    on<SessionCompleted>((event, emit) {
      emit(state.copyWith(status: SessionStatus.completed));
    });

    on<TimerTicked>((event, emit) {
      // Lógica para manejar el tick del temporizador
      if(state.elapsedTime >= sessionDuration) {
        add(SessionCompleted());
        return;
      }
      if(state.elapsedTimeSinceLastStep.inSeconds >= state.currentStep.duration - 1) {
        emit(state.copyWith(
          elapsedTime: event.elapsedTime,
          elapsedTimeSinceLastStep: Duration.zero,
          status: SessionStatus.stepChanged,
          currentStep: state.profile.steps[(state.profile.steps.indexOf(state.currentStep) + 1) % state.profile.steps.length],
        ));
        _playPhase(
          switch (state.currentStep.type) {
            StepType.inhale => 'sounds/phase1.mp3',
            StepType.hold => 'sounds/phase2.mp3',
            StepType.exhale => 'sounds/phase3.mp3',
          }
        );
        return;
      }
      if(event.elapsedTime.inSeconds == state.elapsedTime.inSeconds) {
        return;
      }
      if(event.elapsedTime == Duration.zero) {
        return;
      }
      //print(event.elapsedTime);
      emit(state.copyWith(
        elapsedTime: event.elapsedTime,
        elapsedTimeSinceLastStep: state.elapsedTimeSinceLastStep + Duration(seconds: 1),
      ));
      _playTick();
    });
  }

  Future<void> _playTick() async {
    if (_audioDisabled || isClosed) return;
    try {
      _tickPlayer ??= AudioPlayer()..setPlayerMode(PlayerMode.lowLatency);
      // For lowLatency mode, resume() works best if the player was paused or stopped.
      // However, simply calling play() is more robust for repeated sounds.
      await _tickPlayer!.stop();
      if (isClosed) return;
      await _tickPlayer!.play(AssetSource('sounds/tick1.mp3'));
    } catch (_) {
      // Avoid crashing the session if audio fails for any reason.
    }
  }

  Future<void> _playPhase(String path) async {
    if (_audioDisabled || isClosed) return;
    try {
      // Use mediaPlayer for phases to avoid decoding issues with larger files
      _phasePlayer ??= AudioPlayer()..setPlayerMode(PlayerMode.mediaPlayer);
      await _phasePlayer!.stop();
      if (isClosed) return;
      await _phasePlayer!.play(AssetSource(path));
    } catch (_) {
      // Avoid crashing the session if audio fails for any reason.
    }
  }

  @override
  Future<void> close() async {
    _streamSubscription?.cancel();
    timer.stop();
    try {
      await _tickPlayer?.stop();
      await _tickPlayer?.dispose();
    } catch (_) {}
    try {
      await _phasePlayer?.stop();
      await _phasePlayer?.dispose();
    } catch (_) {}
    return super.close();
  }
}
