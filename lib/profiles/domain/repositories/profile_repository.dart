import 'package:respiro/profiles/domain/domain.dart';

abstract class ProfilesRepository {

  Stream<List<BreathingProfile>> getProfiles();

  Future<void> addProfile(BreathingProfile profile);

  Future<void> deleteProfile(BreathingProfile profile);

  Future<void> deleteAllProfiles();

  Future<void> updateProfile(BreathingProfile profile);

  Future<bool> isDatabaseEmpty();

  Future<int> databaseCount();

  Future<void> loadInitialValues();

  Future<void> close();

}