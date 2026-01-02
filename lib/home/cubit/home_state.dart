part of 'home_cubit.dart';

enum HomeStatus {
  loading,
  loaded,
}

class HomeState extends Equatable {

  final List<Routine> breathingProfiles;
  final int selectedProfile;
  final HomeStatus status;

  const HomeState({
    this.breathingProfiles = const <Routine>[], 
    this.selectedProfile = 0,
    this.status = HomeStatus.loading,
  });

  

  HomeState copyWith({
    List<Routine>? breathingProfiles, 
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
