part of 'session_audio_cubit.dart';

class SessionAudioState extends Equatable {

  final bool isSoundDisabled;
  final double volume;


  const SessionAudioState({
    this.isSoundDisabled = false,
    this.volume = 1.0,
  });
  

  copyWith({
    bool? isSoundDisabled,
    double? volume,
  }) {
    return SessionAudioState(
      isSoundDisabled: isSoundDisabled ?? this.isSoundDisabled,
      volume: volume ?? this.volume,
    );
  }

  @override
  List<Object> get props => [
        isSoundDisabled,
        volume,
  ];
}

final class SessionAudioInitial extends SessionAudioState {}
