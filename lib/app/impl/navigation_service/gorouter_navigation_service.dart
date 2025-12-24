import 'package:go_router/go_router.dart';

import 'package:respiro/profiles/profiles.dart';
import 'package:respiro/app/navigation_service/navigation_service.dart';
import 'package:respiro/app/router/route_names.dart';


class GoRouterNavigationService implements NavigationService{
  final GoRouter goRouter;  

  GoRouterNavigationService({required this.goRouter});

  @override
  void goToHome() {
    goRouter.pushNamed(RouteNames.home);
  }

  @override
  void goToBreathingSession(BreathingProfile profile, int minutes) {
    goRouter.pushNamed(
      RouteNames.breathingSession,
      extra: {
        'profile': profile,
        'sessionDuration': minutes,
      },
    );
  }

  @override
  void goToPreferences() {
    goRouter.pushNamed(RouteNames.preferences);
  }

  @override
  void goBack() {
    if(goRouter.canPop()) goRouter.pop();
  }
}