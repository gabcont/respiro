import 'package:respiro/profiles/domain/domain.dart';

abstract class BreathingProfilesDataSource {

  Stream<List<BreathingProfile>> getProfiles();

  Future<void> addProfile(BreathingProfile profile);
  
  Future<void> deleteProfile(BreathingProfile profile);

  Future<void> deleteAllProfiles();

  Future<void> updateProfile(BreathingProfile profile);

  Future<bool> isDatabaseEmpty();

  Future<int> databaseCount();
  
  Future<void> close();
}