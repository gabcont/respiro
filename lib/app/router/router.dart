import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:respiro/app/navigation_service/navigation_service.dart';

import 'package:respiro/app/router/route_names.dart';
import 'package:respiro/home/cubit/home_cubit.dart';

import 'package:respiro/profiles/profiles.dart';
import 'package:respiro/home/home.dart';
import 'package:respiro/preferences/preferences.dart';
import 'package:respiro/session/bloc/session_bloc.dart';
import 'package:respiro/session/impl/timer_service/stream_timer.dart';
import 'package:respiro/session/session.dart';

class RespiroRouter {
  // Home Page
  final GoRouter router = GoRouter(
    routes: [
      // Home Page
      GoRoute(
        name: RouteNames.home,
        path: '/',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => HomeCubit(
              profilesRepository: context.read<ProfilesRepository>(),
              preferencesRepository: context.read<PreferencesRepository>(),
              navigationService: context.read<NavigationService>(),
            ),
            child: HomePage(),
          );
        },
        routes: [
          // Session Page
          GoRoute(
            name: RouteNames.breathingSession,
            path: RouteNames.breathingSession,
            builder: (context, state) {
              final args = state.extra as Map<String, dynamic>;
              return BlocProvider(
                create: (context) => SessionBloc(
                  navigationService: context.read<NavigationService>(),
                  preferencesRepository: context.read<PreferencesRepository>(),
                  timer: StreamTimer(),
                  profile: args['profile'] as BreathingProfile,
                  sessionDuration: Duration(minutes: args['sessionDuration'] as int),
                ),
                child: SessionPage(
                  activeProfile: args['profile'] as BreathingProfile,
                  sessionDuration: Duration(minutes: args['sessionDuration'] as int),
                ),
              );
            },
          ),

          // Preferences Page
          GoRoute(
            name: RouteNames.preferences,
            path: RouteNames.preferences,
            builder: (context, state) {
              return PreferencesPage();
            },
          ),
        ],
      ),
    ],
  );
}
