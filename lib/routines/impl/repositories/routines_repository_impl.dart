import 'package:respiro/routines/datasources/routines_datasource.dart';
import 'package:respiro/routines/models/models.dart';
import 'package:respiro/routines/repositories/routines_repository.dart';
import 'package:respiro/routines/impl/repositories/default_values/initial_profiles.dart';

class RoutinesRepositoryImpl implements RoutinesRepository {
  final RoutinesDataSource dataSource;

  RoutinesRepositoryImpl(this.dataSource);

  @override
  Stream<List<Routine>> getRoutines() async* {
    if (await isDatabaseEmpty()) {
      await loadDefaultValues();
    }
    yield* dataSource.getRoutines();
  }

  @override
  Future<void> addRoutine(Routine routine) {
    return dataSource.addRoutine(routine);
  }

  @override
  Future<void> deleteRoutine(int id) {
    return dataSource.deleteRoutine(id);
  }

  @override
  Future<void> deleteAllRoutines() {
    return dataSource.deleteAllRoutines();
  }

  @override
  Future<void> updateRoutine(int id, Routine routine) {
    routine.id = id;
    return dataSource.updateRoutine(routine);
  }

  @override
  Future<Routine> getRoutineById(int id) async {
    final routine = await dataSource.getRoutineById(id);
    if (routine == null) {
      throw Exception('Routine not found');
    }
    return routine;
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
    List<Routine> initialProfiles = InitialProfiles.get();
    for (var profile in initialProfiles) {
      await addRoutine(profile);
    }
  }

  @override
  Future<void> close() {
    return dataSource.close();
  }
}
