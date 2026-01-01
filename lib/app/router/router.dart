import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import 'package:respiro/app/router/route_names.dart';
import 'package:respiro/preferences/cubit/preferences_cubit.dart';

import 'package:respiro/session/session.dart';
import 'package:respiro/profiles/profiles.dart';
import 'package:respiro/home/home.dart';
import 'package:respiro/preferences/preferences.dart';

import 'package:respiro/session/audio_cubit/session_audio_cubit.dart';
import 'package:respiro/session/bloc/session_bloc.dart';
import 'package:respiro/session/impl/timer_service/stream_timer.dart';
import 'package:respiro/home/cubit/home_cubit.dart';
import 'package:respiro/sound/sound_service.dart';
import 'package:respiro/app/navigation_service/navigation_service.dart';

class RespiroRouter {
  
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Home Page
  late final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: RouteNames.initial,
    routes: [
      // Home Page
      GoRoute(
        name: RouteNames.home,
        path: RouteNames.initial,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(
            navigationService: context.read<NavigationService>(),
            profilesRepository: context.read<ProfilesRepository>(),
            preferencesRepository: context.read<PreferencesRepository>(),
          ),
          child: const HomePage(),
        ),
      ),
      // Session Page
      GoRoute(
        name: RouteNames.breathingSession,
        path: '/${RouteNames.breathingSession}',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SessionBloc(
                  navigationService: context.read<NavigationService>(),
                  soundService: context.read<SoundService>(),
                  preferencesRepository: context.read<PreferencesRepository>(),
                  timer: StreamTimer(),
                  profile: args['profile'] as BreathingProfile,
                  sessionDuration: Duration(
                    minutes: args['sessionDuration'] as int,
                  ),
                ),
              ),
              BlocProvider(
                create: (context) => SessionAudioCubit(
                  preferencesRepository: context.read<PreferencesRepository>(),
                  soundService: context.read<SoundService>(),
                ),
              ),
            ],
            child: SessionPage(
              activeProfile: args['profile'] as BreathingProfile,
              sessionDuration: Duration(
                minutes: args['sessionDuration'] as int,
              ),
            ),
          );
        },
      ),

      // Preferences Page
      GoRoute(
        name: RouteNames.preferences,
        path: '/${RouteNames.preferences}',
        builder: (context, state) {
          context.read<PreferencesCubit>().loadPreferences();
          return PreferencesPage();
        },
      ),
    ],
  );
}