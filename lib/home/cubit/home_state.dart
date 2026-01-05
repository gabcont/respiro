part of 'home_cubit.dart';

enum HomeStatus {
  loading,
  loaded,
}

class HomeState extends Equatable {

  final List<Routine> routines;
  final int selectedRoutine;
  final HomeStatus status;

  const HomeState({
    this.routines = const <Routine>[], 
    this.selectedRoutine = 0,
    this.status = HomeStatus.loading,
  });

  

  HomeState copyWith({
    List<Routine>? routines, 
    int? selectedRoutine,
    HomeStatus? status,
  }) {
    return HomeState(
      routines: routines ?? this.routines,
      selectedRoutine: selectedRoutine ?? this.selectedRoutine,
      status: status ?? this.status,
    );
  }  

  @override
  List<Object> get props => [routines, selectedRoutine, status];
}
