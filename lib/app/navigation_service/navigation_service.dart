import 'package:respiro/profiles/profiles.dart';

abstract class NavigationService {
  void goToHome();
  void goToBreathingSession(BreathingProfile profile, int minutes);
  void goToPreferences();
  void goBack();
}