import 'package:respiro/routines/models/models.dart';

abstract class SequencesDataSource {
  Stream<List<Sequence>> getSequences();

  Future<void> addSequence(Sequence sequence);

  Future<void> deleteSequence(int id);

  Future<void> deleteAllSequences();

  Future<void> updateSequence(int id, Sequence sequence);

  Future<Sequence?> getSequenceById(int id);

  Future<bool> isDatabaseEmpty();

  Future<int> databaseCount();

  Future<void> close();
}
