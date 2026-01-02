part of 'session_bloc.dart';

enum SessionStatus { initial, resumed, stepChanged, paused, completed, reseted, canceled }

class SessionState extends Equatable {
  
  final SessionStatus status;
  final Duration sessionDuration;
  final Duration elapsedTime;
  final Duration elapsedTimeSinceLastStep;
  final Routine profile;
  final SequenceStep currentStep;
  final int currentStepIndex;

  const SessionState({
    this.status = SessionStatus.initial,
    this.sessionDuration = Duration.zero,
    this.elapsedTime = Duration.zero,
    this.elapsedTimeSinceLastStep = Duration.zero,
    required this.profile,
    required this.currentStep,
    this.currentStepIndex = 0,
  });

  SessionState copyWith({
    SessionStatus? status,
    Duration? sessionDuration,
    Duration? elapsedTime,
    Duration? elapsedTimeSinceLastStep,
    Routine? profile,
    SequenceStep? currentStep,
    int? currentStepIndex,
  }) {
    return SessionState(
      status: status ?? this.status,
      sessionDuration: sessionDuration ?? this.sessionDuration,
      elapsedTime: elapsedTime ?? this.elapsedTime,
      elapsedTimeSinceLastStep: elapsedTimeSinceLastStep ?? this.elapsedTimeSinceLastStep,
      profile: profile ?? this.profile,
      currentStep: currentStep ?? this.currentStep,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
    );
  }

  @override
  List<Object> get props => [
        status,
        sessionDuration,
        elapsedTime,
        elapsedTimeSinceLastStep,
        profile,
        currentStep,
      ];
}

