import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:respiro/app/navigation_service/navigation_service.dart';

import 'package:respiro/preferences/preferences.dart';
import 'package:respiro/routines/routines.dart';
import 'package:respiro/session/session.dart';
import 'package:respiro/sound/sound_service.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {

  final NavigationService navigationService;
  final PreferencesRepository preferencesRepository;
  final SessionTimerService timer;
  final SoundService soundService;

  StreamSubscription? _streamSubscription;
  List<SequenceStep> _flatSteps = [];

  SessionBloc({
    required this.preferencesRepository, 
    required Routine profile, 
    required Duration sessionDuration, 
    required this.timer,
    required this.navigationService,
    required this.soundService,
  }) : _flatSteps = _flattenRoutineStatic(profile),
       super(SessionState(
         profile: profile,
         currentStep: _flattenRoutineStatic(profile).isNotEmpty ? _flattenRoutineStatic(profile)[0] : SequenceStep(),
         currentStepIndex: 0,
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

      // Emitir el estado inicial del sesión
      emit(state.copyWith(
        status: SessionStatus.stepChanged,
        profile: event.profile,
        sessionDuration: event.sessionDuration,
        elapsedTime: Duration.zero,
        currentStep: _flatSteps.isNotEmpty ? _flatSteps[0] : SequenceStep(),
        currentStepIndex: 0,
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
        currentStep: _flatSteps.isNotEmpty ? _flatSteps[0] : SequenceStep(),
        currentStepIndex: 0,
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
      if(state.elapsedTime >= state.sessionDuration) {
        add(SessionCompleted());
        return;
      }

      // Step changed
      if(state.elapsedTimeSinceLastStep.inSeconds >= state.currentStep.stepDuration - 1) {
        var nextIndex = (state.currentStepIndex + 1) % _flatSteps.length;
        var nextStep = _flatSteps[nextIndex];
        
        emit(state.copyWith(
          elapsedTime: event.elapsedTime,
          elapsedTimeSinceLastStep: Duration.zero,
          status: SessionStatus.stepChanged,
          currentStep: nextStep,
          currentStepIndex: nextIndex,
        ));
        soundService.playSound(
          switch (nextStep.type) {
            StepType.inhale => Sounds.inhalePhaseStarted,
            StepType.exhale => Sounds.exhalePhaseStarted,
            StepType.hold => Sounds.holdPhaseStarted,
            StepType.meditate => Sounds.holdPhaseStarted,
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

  static List<SequenceStep> _flattenRoutineStatic(Routine routine) {
    List<SequenceStep> flatSteps = [];
    for (var phase in routine.phases) {
      if (phase.sequence != null) {
        for (int i = 0; i < phase.cycles; i++) {
          flatSteps.addAll(phase.sequence!.steps);
        }
      }
    }
    if (flatSteps.isEmpty) {
      flatSteps.add(SequenceStep());
    }
    return flatSteps;
  }



  @override
  Future<void> close() async {
    _streamSubscription?.cancel();
    timer.stop();
    return super.close();
  }
}
