import 'package:isar/isar.dart';
import 'package:respiro/profiles/profiles.dart';

class ProfilesIsarDataSource implements BreathingProfilesDataSource {

  final Isar isar;

  ProfilesIsarDataSource(this.isar);

  @override
  Future<void> addProfile(BreathingProfile profile) async {
    // Implement your logic to add a profile using Isar
    await isar.writeTxn(() async {
      await isar.breathingProfiles.put( profile );
    }
    );
  }

  @override
  Future<void> deleteProfile(BreathingProfile profile) async {
    // Implement your logic to delete a profile using Isar
    await isar.writeTxn(() async {
      await isar.breathingProfiles.delete(profile.id);
    }
    );
  }

  @override
  Future<void> deleteAllProfiles() async {
    // Implement your logic to delete all profiles using Isar
    await isar.writeTxn(() async {
      await isar.breathingProfiles.clear();
    });
  }

  @override
  Future<void> updateProfile(BreathingProfile profile) async {
    // Implement your logic to update a profile using Isar
    await isar.writeTxn(() async {
      await isar.breathingProfiles.put(profile);
    
    }
    );
  }

  @override
  Stream<List<BreathingProfile>> getProfiles() {
    // Implement your logic to get profiles using Isar
    return isar.breathingProfiles.where().watch(fireImmediately: true);
  }

  @override
  Future<int> databaseCount() async {
    return await isar.breathingProfiles.count();
  }

  @override
  Future<bool> isDatabaseEmpty() async {
    return await databaseCount() < 1 ? true : false;
  }

  @override
  Future<void> close() async {
    // Implement your logic to close the Isar connection
    await isar.close();
  }
}