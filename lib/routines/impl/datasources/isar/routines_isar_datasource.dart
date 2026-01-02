import 'package:isar/isar.dart';
import 'package:respiro/routines/datasources/routines_datasource.dart';
import 'package:respiro/routines/models/models.dart';

class RoutinesIsarDataSource implements RoutinesDataSource {
  final Isar isar;

  RoutinesIsarDataSource(this.isar);

  @override
  Stream<List<Routine>> getRoutines() {
    return isar.routines.where().watch(fireImmediately: true);
  }

  @override
  Future<void> addRoutine(Routine routine) async {
    await isar.writeTxn(() async {
      await isar.routines.put(routine);
    });
  }

  @override
  Future<void> deleteRoutine(int id) async {
    await isar.writeTxn(() async {
      await isar.routines.delete(id);
    });
  }

  @override
  Future<void> deleteAllRoutines() async {
    await isar.writeTxn(() async {
      await isar.routines.clear();
    });
  }

  @override
  Future<void> updateRoutine(Routine routine) async {
    await isar.writeTxn(() async {
      await isar.routines.put(routine);
    });
  }

  @override
  Future<Routine?> getRoutineById(int id) async {
    return isar.routines.get(id);
  }

  @override
  Future<bool> isDatabaseEmpty() async {
    return await isar.routines.count() == 0;
  }

  @override
  Future<int> databaseCount() async {
    return isar.routines.count();
  }

  @override
  Future<void> close() async {
    // Isar instance is usually managed by a provider or service locator, 
    // so we might not want to close it here unless we opened it here.
    // But if the interface requires it:
    // await isar.close(); 
    // For now, let's do nothing or just return.
  }
}
