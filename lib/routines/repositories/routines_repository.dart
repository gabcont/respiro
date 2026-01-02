import 'package:respiro/routines/models/models.dart';

abstract class RoutinesRepository {
  Stream<List<Routine>> getRoutines();

  Future<void> addRoutine(Routine routine);

  Future<void> deleteRoutine(int id);

  Future<void> deleteAllRoutines();

  Future<void> updateRoutine(int id, Routine routine);

  Future<Routine> getRoutineById(int id);

  Future<bool> isDatabaseEmpty();

  Future<int> databaseCount();

  Future<void> loadDefaultValues();

  Future<void> close();
}