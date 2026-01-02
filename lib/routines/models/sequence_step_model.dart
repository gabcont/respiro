import 'package:isar/isar.dart';
import 'package:respiro/routines/models/enums.dart';

part 'sequence_step_model.g.dart';

@embedded
class SequenceStep {
  @enumerated
  StepType type;
  
  int stepDuration; // Duration in seconds? Assuming int based on request
  
  String? rawName;
  String? rawDescription;
  String? localizationKey;

  SequenceStep({
    this.type = StepType.inhale,
    this.stepDuration = 0,
    this.rawName,
    this.rawDescription,
    this.localizationKey,
  });
}
