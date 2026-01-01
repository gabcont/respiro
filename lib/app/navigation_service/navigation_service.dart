import 'package:respiro/profiles/profiles.dart';

abstract class NavigationService {
  void goToHome();
  void goToLibrary();
  void goToPreview(bool shouldAnimate);
  void goToBreathingSession(BreathingProfile profile, int minutes);
  void goToPreferences();
  void goBack();
}