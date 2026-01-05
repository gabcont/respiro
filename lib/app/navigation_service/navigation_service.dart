import 'package:respiro/routines/routines.dart';

abstract class NavigationService {
  void goToHome();
  void goToLibrary();
  void goToPreview(bool shouldAnimate);
  void goToSession(Routine routine);
  void goToPreferences();
  void goBack();
}