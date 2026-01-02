import 'package:isar/isar.dart';
import 'package:respiro/routines/routines.dart';

class ProfilesIsarDataSource implements BreathingProfilesDataSource {

  final Isar isar;

  ProfilesIsarDataSource(this.isar);

  @override
  Future<void> addProfile(Routine profile) async {
    // Implement your logic to add a profile using Isar
    await isar.writeTxn(() async {
      await isar.routines.put( profile );
    }
    );
  }

  @override
  Future<void> deleteProfile(Routine profile) async {
    // Implement your logic to delete a profile using Isar
    await isar.writeTxn(() async {
      await isar.routines.delete(profile.id);
    }
    );
  }

  @override
  Future<void> deleteAllProfiles() async {
    // Implement your logic to delete all profiles using Isar
    await isar.writeTxn(() async {
      await isar.routines.clear();
    });
  }

  @override
  Future<void> updateProfile(Routine profile) async {
    // Implement your logic to update a profile using Isar
    await isar.writeTxn(() async {
      await isar.routines.put(profile);
    
    }
    );
  }

  @override
  Stream<List<Routine>> getProfiles() {
    // Implement your logic to get profiles using Isar
    return isar.routines.where().watch(fireImmediately: true);
  }

  @override
  Future<int> databaseCount() async {
    return await isar.routines.count();
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