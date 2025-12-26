import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:respiro/app/navigation_service/navigation_service.dart';

import 'package:respiro/preferences/preferences.dart';
import 'package:respiro/profiles/profiles.dart';
import 'package:respiro/session/session.dart';
import 'package:respiro/sound/sound_service.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {

  final NavigationService navigationService;
  final PreferencesRepository preferencesRepository;
  final SessionTimerService timer;
  final SoundService soundService;

  bool _audioDisabled = false;
  StreamSubscription? _streamSubscription;

  SessionBloc({
    required this.preferencesRepository, 
    required BreathingProfile profile, 
    required Duration sessionDuration, 
    required this.timer,
    required this.navigationService,
    required this.soundService,
  }) 
  : super(SessionState(
    profile: profile,
    currentStep: profile.steps.isNotEmpty ? profile.steps[0] : BreathingStep(),
  )) {
    
    on<SessionStarted>((event, emit) async {

      // Load sounds
      await soundService.loadAudioAsset(Sounds.secondPassed);
      await soundService.loadAudioAsset(Sounds.exhalePhaseStarted);
      await soundService.loadAudioAsset(Sounds.inhalePhaseStarted);
      await soundService.loadAudioAsset(Sounds.holdPhaseStarted);
    

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

      // Session Finished
      if(state.elapsedTime >= sessionDuration) {
        add(SessionCompleted());
        return;
      }

      // Step changed
      if(state.elapsedTimeSinceLastStep.inSeconds >= state.currentStep.duration - 1) {
        var nextStep = state.profile.steps[(state.profile.steps.indexOf(state.currentStep) + 1) % state.profile.steps.length];
        emit(state.copyWith(
          elapsedTime: event.elapsedTime,
          elapsedTimeSinceLastStep: Duration.zero,
          status: SessionStatus.stepChanged,
          currentStep: nextStep,
        ));
        soundService.playSound(
          switch (nextStep.type) {
            StepType.inhale => Sounds.inhalePhaseStarted,
            StepType.exhale => Sounds.exhalePhaseStarted,
            StepType.hold => Sounds.holdPhaseStarted,
          }
        );
        return;
      }

      // TODO: Refactorizar chequeo de tiempo
      // IDK why this is here
      if(event.elapsedTime.inSeconds == state.elapsedTime.inSeconds) {
        return;
      }
      if(event.elapsedTime == Duration.zero) {
        return;
      }

      // Only Second Passed
      emit(state.copyWith(
        elapsedTime: event.elapsedTime,
        elapsedTimeSinceLastStep: state.elapsedTimeSinceLastStep + Duration(seconds: 1),
      ));
      soundService.playSound(Sounds.secondPassed);
    });
  }


  @override
  Future<void> close() async {
    _streamSubscription?.cancel();
    timer.stop();
    return super.close();
  }
}
