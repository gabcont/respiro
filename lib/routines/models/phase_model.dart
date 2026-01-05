import 'package:isar/isar.dart';
import 'package:respiro/routines/models/sequence_model.dart';

part 'phase_model.g.dart';

@embedded
class Phase {
  EmbeddedSequence? sequence;
  
  int cycles;
  
  String? rawName;
  String? rawDescription;
  String? localizationKey;

  Phase({
    this.sequence,
    this.cycles = 1,
    this.rawName,
    this.rawDescription,
    this.localizationKey,
  });

  int get totalDuration {
    return sequence!.totalDuration * cycles;
  }
}
