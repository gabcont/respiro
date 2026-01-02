import 'package:isar/isar.dart';
import 'package:respiro/routines/datasources/sequences_datasource.dart';
import 'package:respiro/routines/models/models.dart';

class SequencesIsarDataSource implements SequencesDataSource {
  final Isar isar;

  SequencesIsarDataSource(this.isar);

  @override
  Stream<List<Sequence>> getSequences() {
    return isar.sequences.where().watch(fireImmediately: true);
  }

  @override
  Future<void> addSequence(Sequence sequence) async {
    await isar.writeTxn(() async {
      await isar.sequences.put(sequence);
    });
  }

  @override
  Future<void> deleteSequence(int id) async {
    await isar.writeTxn(() async {
      await isar.sequences.delete(id);
    });
  }

  @override
  Future<void> deleteAllSequences() async {
    await isar.writeTxn(() async {
      await isar.sequences.clear();
    });
  }

  @override
  Future<void> updateSequence(int id, Sequence sequence) async {
    await isar.writeTxn(() async {
      sequence.id = id;
      await isar.sequences.put(sequence);
    });
  }

  @override
  Future<Sequence?> getSequenceById(int id) async {
    return isar.sequences.get(id);
  }

  @override
  Future<bool> isDatabaseEmpty() async {
    return await isar.sequences.count() == 0;
  }

  @override
  Future<int> databaseCount() async {
    return isar.sequences.count();
  }

  @override
  Future<void> close() async {
  }
}
