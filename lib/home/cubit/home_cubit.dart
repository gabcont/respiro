import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

import 'package:respiro/profiles/profiles.dart';
import 'package:respiro/preferences/preferences.dart';
import 'package:respiro/app/navigation_service/navigation_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  StreamSubscription? _dbSuscription;
  final ProfilesRepository profilesRepository;
  final PreferencesRepository preferencesRepository;
  final NavigationService navigationService;  

  HomeCubit({
    required this.preferencesRepository,
    required this.profilesRepository,
    required this.navigationService,
  }) : super(const HomeState()) {
    onInitialized();
  }

  
  void onInitialized() async {

    // Emit loading state
    emit(state.copyWith(status: HomeStatus.loading));

    // Listen to database changes
    _dbSuscription = profilesRepository.getProfiles().listen(_onFetchProfiles);

    // Load initial data if first time
    bool isEmpty = await profilesRepository.isDatabaseEmpty();
    bool isFirstTime = await preferencesRepository.getIsFirstTime();
    if((isFirstTime && isEmpty) || isEmpty) {
      // Set first time to false
      await preferencesRepository.saveIsFirstTime(false);
    }

    // Set last selected profile
    final lastProfileId = await preferencesRepository.getLastProfileSelected();

    if (lastProfileId != null && lastProfileId < state.breathingProfiles.length) {
      emit(state.copyWith(selectedProfile: lastProfileId, status: HomeStatus.loaded));
    }
    else {  // Set as 0 if null or out of range
      emit(state.copyWith(selectedProfile: 0, status: HomeStatus.loaded));
    }
  }

  void onBreathingSessionStarted(BreathingProfile profile, int minutes) {
    navigationService.goToBreathingSession(
      profile,
      minutes,
    );
  }

  void onPreferencesPressed() {
    navigationService.goToPreferences();
  }


  void onPreviewTabPressed(bool shouldAnimate) {
    navigationService.goToPreview(shouldAnimate);
  }

  void onLibraryTabPressed() {
    navigationService.goToLibrary();
  }

  void onProfileSelected(int id) async {
    if(id < 0 || id >= state.breathingProfiles.length && id == state.selectedProfile) return;
    emit(state.copyWith(selectedProfile: id));
    preferencesRepository.saveLastProfileSelected(id);
  }

  void _onFetchProfiles(List<BreathingProfile> newProfiles) {
    if(newProfiles.isEmpty) {
      emit(state.copyWith(breathingProfiles: [], status: HomeStatus.loading));
      //onReloadProfileRepositoryConnection();
      return;
    }
    emit(state.copyWith(breathingProfiles: newProfiles, status: HomeStatus.loaded));
  }

  @override
  Future<void> close() {
    _dbSuscription?.cancel();
    profilesRepository.close();
    return super.close();
  }
}
