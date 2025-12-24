part of 'session_bloc.dart';

enum SessionStatus { initial, resumed, stepChanged, paused, completed, reseted, canceled }

class SessionState extends Equatable {
  final SessionStatus status;
  final Duration sessionDuration;
  final Duration elapsedTime;
  final Duration elapsedTimeSinceLastStep;
  final BreathingProfile profile;
  final BreathingStep currentStep;

  const SessionState({
    this.status = SessionStatus.initial,
    this.sessionDuration = Duration.zero,
    this.elapsedTime = Duration.zero,
    this.elapsedTimeSinceLastStep = Duration.zero,
    required this.profile,
    required this.currentStep,
  });

  SessionState copyWith({
    SessionStatus? status,
    Duration? sessionDuration,
    Duration? elapsedTime,
    Duration? elapsedTimeSinceLastStep,
    BreathingProfile? profile,
    BreathingStep? currentStep,
  }) {
    return SessionState(
      status: status ?? this.status,
      sessionDuration: sessionDuration ?? this.sessionDuration,
      elapsedTime: elapsedTime ?? this.elapsedTime,
      elapsedTimeSinceLastStep: elapsedTimeSinceLastStep ?? this.elapsedTimeSinceLastStep,
      profile: profile ?? this.profile,
      currentStep: currentStep ?? this.currentStep,
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

