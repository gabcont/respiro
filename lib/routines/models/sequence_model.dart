import 'package:isar/isar.dart';
import 'package:respiro/routines/models/sequence_step_model.dart';

part 'sequence_model.g.dart';

@collection
class Sequence {
  Id id = Isar.autoIncrement;

  List<SequenceStep> steps;
  
  String? rawName;
  String? rawDescription;
  String? localizationKey;

  Sequence({
    this.steps = const [],
    this.rawName,
    this.rawDescription,
    this.localizationKey,
  });

  int get totalDuration {
    return steps.fold(0, (sum, step) => sum + step.stepDuration);
  }

  EmbeddedSequence toEmbedded() {
    return EmbeddedSequence(
      steps: steps,
      rawName: rawName,
      rawDescription: rawDescription,
      localizationKey: localizationKey,
    );
  }
}

@embedded
class EmbeddedSequence {
  List<SequenceStep> steps;
  
  String? rawName;
  String? rawDescription;
  String? localizationKey;

  EmbeddedSequence({
    this.steps = const [],
    this.rawName,
    this.rawDescription,
    this.localizationKey,
  });

  int get totalDuration {
    return steps.fold(0, (sum, step) => sum + step.stepDuration);
  }
}
