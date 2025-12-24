part of 'session_bloc.dart';

sealed class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

final class SessionStarted extends SessionEvent {
  final BreathingProfile profile;
  final Duration sessionDuration;

  const SessionStarted({
    required this.profile,
    required this.sessionDuration,
  });

  @override
  List<Object> get props => [profile, sessionDuration];
}

final class SessionPaused extends SessionEvent {
  const SessionPaused();
}

final class SessionResumed extends SessionEvent {
  const SessionResumed();
}

final class SessionReset extends SessionEvent {
  const SessionReset();
}

final class SessionCanceled extends SessionEvent {
  const SessionCanceled();
}

final class SessionCompleted extends SessionEvent {
  const SessionCompleted();
}

final class TimerTicked extends SessionEvent {
  final Duration elapsedTime;
  const TimerTicked({required this.elapsedTime});
}