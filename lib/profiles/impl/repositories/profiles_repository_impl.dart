import 'package:respiro/profiles/profiles.dart';
import 'package:respiro/profiles/impl/repositories/default_values/default_values.dart';

class ProfilesRepositoryImpl implements ProfilesRepository {
  final BreathingProfilesDataSource dataSource;

  ProfilesRepositoryImpl(this.dataSource);

  @override
  Future<void> addProfile(BreathingProfile profile) {
    return dataSource.addProfile(profile);
  }

  @override
  Future<void> deleteProfile(BreathingProfile profile) {
    return dataSource.deleteProfile(profile);
  }

  @override
  Future<void> deleteAllProfiles() {
    return dataSource.deleteAllProfiles();
  }

  @override
  Future<void> updateProfile(BreathingProfile profile) {
    return dataSource.updateProfile(profile);
  }

  @override
  Stream<List<BreathingProfile>> getProfiles() async* {
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
      List<BreathingProfile> initialProfiles = InitialProfiles.get();
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