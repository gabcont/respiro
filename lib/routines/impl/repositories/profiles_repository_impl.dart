import 'package:respiro/routines/routines.dart';
import 'package:respiro/routines/impl/repositories/default_values/default_values.dart';

class ProfilesRepositoryImpl implements ProfilesRepository {
  final BreathingProfilesDataSource dataSource;

  ProfilesRepositoryImpl(this.dataSource);

  @override
  Future<void> addProfile(Routine profile) {
    return dataSource.addProfile(profile);
  }

  @override
  Future<void> deleteProfile(Routine profile) {
    return dataSource.deleteProfile(profile);
  }

  @override
  Future<void> deleteAllProfiles() {
    return dataSource.deleteAllProfiles();
  }

  @override
  Future<void> updateProfile(Routine profile) {
    return dataSource.updateProfile(profile);
  }

  @override
  Stream<List<Routine>> getProfiles() async* {
    loadInitialValues();
    yield* dataSource.getProfiles();
  }

  @override
  Future<int> databaseCount() {
    return dataSource.databaseCount();
  }

  @override
  Future<bool> isDatabaseEmpty() {
    return dataSource.isDatabaseEmpty();
  }

  @override
  Future<void> loadInitialValues() async {
    if(await isDatabaseEmpty()) {
      List<Routine> initialProfiles = InitialProfiles.get();
      for (var profile in initialProfiles) {
        await addProfile(profile);
      }
    }
  }

  @override
  Future<void> close() async {
    await dataSource.close();
    return;
  }
}