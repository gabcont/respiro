import 'package:respiro/routines/routines.dart';

abstract class NavigationService {
  void goToHome();
  void goToLibrary();
  void goToPreview(bool shouldAnimate);
  void goToBreathingSession(Routine profile, int minutes);
  void goToPreferences();
  void goBack();
}