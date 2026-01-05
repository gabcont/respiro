import 'package:isar/isar.dart';
import 'package:respiro/routines/models/enums.dart';
import 'package:respiro/routines/models/phase_model.dart';
import 'package:respiro/routines/models/sequence_model.dart';
import 'package:respiro/routines/models/sequence_step_model.dart';
import 'package:respiro/routines/models/tag_model.dart';

part 'routine_model.g.dart';

@collection
class Routine {
  Id id = Isar.autoIncrement;

  List<Phase> phases;
  
  String? rawName;
  String? rawShortDescription;
  String? rawLongDescription;
  String? rawBenefitsDescription;
  String? localizationKey;
  
  @enumerated
  Difficulty difficulty;
  
  final tags = IsarLinks<Tag>();

  Routine({
    this.phases = const [],
    this.rawName,
    this.rawShortDescription,
    this.rawLongDescription,
    this.rawBenefitsDescription,
    this.localizationKey,
    this.difficulty = Difficulty.easy,
  });

  int get totalDuration {
    return phases.fold(0, (sum, phase) => sum + phase.totalDuration);
  }
}
