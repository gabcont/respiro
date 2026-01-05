import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

import 'package:respiro/routines/routines.dart';
import 'package:respiro/preferences/preferences.dart';
import 'package:respiro/app/navigation_service/navigation_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  StreamSubscription? _dbSuscription;
  final RoutinesRepository profilesRepository;
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
    _dbSuscription = profilesRepository.getRoutines().listen(_onFetchProfiles);

    // Load initial data if first time
    bool isEmpty = await profilesRepository.isDatabaseEmpty();
    bool isFirstTime = await preferencesRepository.getIsFirstTime();
    if((isFirstTime && isEmpty) || isEmpty) {
      // Set first time to false
      await preferencesRepository.saveIsFirstTime(false);
    }

    // Set last selected profile
    final lastRoutineId = await preferencesRepository.getLastProfileSelected();

    if (lastRoutineId != null && lastRoutineId < state.routines.length) {
      emit(state.copyWith(selectedRoutine: lastRoutineId, status: HomeStatus.loaded));
    }
    else {  // Set as 0 if null or out of range
      emit(state.copyWith(selectedRoutine: 0, status: HomeStatus.loaded));
    }
  }

  void onBreathingSessionStarted(Routine routine) {
    navigationService.goToSession(
      routine,
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
    if(id < 0 || id >= state.routines.length && id == state.selectedRoutine) return;
    emit(state.copyWith(selectedRoutine: id));
    preferencesRepository.saveLastProfileSelected(id);
  }

  void _onFetchProfiles(List<Routine> newProfiles) {
    if(newProfiles.isEmpty) {
      emit(state.copyWith(routines: [], status: HomeStatus.loading));
      //onReloadProfileRepositoryConnection();
      return;
    }
    emit(state.copyWith(routines: newProfiles, status: HomeStatus.loaded));
  }

  @override
  Future<void> close() {
    _dbSuscription?.cancel();
    profilesRepository.close();
    return super.close();
  }
}
