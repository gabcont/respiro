part of 'home_cubit.dart';

enum HomeStatus {
  loading,
  loaded,
}

class HomeState extends Equatable {
  const HomeState({
    this.breathingProfiles = const <BreathingProfile>[], 
    this.selectedProfile = 0,
    this.status = HomeStatus.loading,
  });

  final List<BreathingProfile> breathingProfiles;
  final int selectedProfile;
  final HomeStatus status;

  HomeState copyWith({
    List<BreathingProfile>? breathingProfiles, 
    int? selectedProfile,
    HomeStatus? status,
  }) {
    return HomeState(
      breathingProfiles: breathingProfiles ?? this.breathingProfiles,
      selectedProfile: selectedProfile ?? this.selectedProfile,
      status: status ?? this.status,
    );
  }  

  @override
  List<Object> get props => [breathingProfiles, selectedProfile, status];
}
