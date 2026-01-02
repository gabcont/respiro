import 'package:isar/isar.dart';

part '../../profiles/profiles/domain/models/step_model.g.dart';

enum StepType {
  inhale,
  exhale,
  hold,
}

@embedded
class BreathingStep {
  @enumerated
  final StepType type;
  final double duration;
  final String description;

  BreathingStep({this.type = StepType.inhale, this.duration = 1.0, this.description = ''});

  Map<String, dynamic> toJson() {
    return {
      'type': type.index,
      'duration': duration,
      'description': description,
    };
  }

  factory BreathingStep.fromJson(Map<String, dynamic> json) {
    return BreathingStep(
      type: StepType.values[json['type'] as int],
      duration: (json['duration'] as num).toDouble(),
      description: json['description'] as String,
    );
  }
}