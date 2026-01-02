import 'package:respiro/routines/datasources/sequences_datasource.dart';
import 'package:respiro/routines/models/models.dart';
import 'package:respiro/routines/repositories/sequences_repository.dart';

class SequencesRepositoryImpl implements SequencesRepository {
  final SequencesDataSource dataSource;

  SequencesRepositoryImpl(this.dataSource);

  @override
  Stream<List<Sequence>> getSequences() {
    return dataSource.getSequences();
  }

  @override
  Future<void> addSequence(Sequence sequence) {
    return dataSource.addSequence(sequence);
  }

  @override
  Future<void> deleteSequence(int id) {
    return dataSource.deleteSequence(id);
  }

  @override
  Future<void> deleteAllSequences() {
    return dataSource.deleteAllSequences();
  }

  @override
  Future<void> updateSequence(int id, Sequence sequence) {
    return dataSource.updateSequence(id, sequence);
  }

  @override
  Future<Sequence> getSequenceById(int id) async {
    final sequence = await dataSource.getSequenceById(id);
    if (sequence == null) {
      throw Exception('Sequence not found');
    }
    return sequence;
  }

  @override
  Future<bool> isDatabaseEmpty() {
    return dataSource.isDatabaseEmpty();
  }

  @override
  Future<int> databaseCount() {
    return dataSource.databaseCount();
  }

  @override
  Future<void> loadDefaultValues() async {
    // No default values for sequences yet
  }

  @override
  Future<void> close() {
    return dataSource.close();
  }
}
