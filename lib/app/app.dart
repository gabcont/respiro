import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:respiro/l10n/generated/app_localizations.dart';
import 'package:respiro/app/router/router.dart';
import 'package:respiro/theme/theme.dart';
import 'package:respiro/preferences/preferences.dart';
import 'package:respiro/profiles/profiles.dart';

import 'package:respiro/sound/sound_service.dart';
import 'package:respiro/app/navigation_service/navigation_service.dart';
import 'package:respiro/preferences/cubit/preferences_cubit.dart';

class App extends StatelessWidget {

  final RespiroRouter appRouter;
  final PreferencesRepository preferencesRepository;
  final ProfilesRepository profilesRepository;
  final NavigationService navigationService;
  final SoundService soundService;

  const App({super.key, 
    required this.appRouter,
    required this.preferencesRepository,
    required this.profilesRepository,
    required this.navigationService,
    required this.soundService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: profilesRepository),
        RepositoryProvider.value(value: preferencesRepository),
        RepositoryProvider.value(value: navigationService),
        RepositoryProvider.value(value: soundService),
      ],
      child: BlocProvider(
        create: (context) => PreferencesCubit(
          profilesRepository: context.read<ProfilesRepository>(),
          preferencesRepository: context.read<PreferencesRepository>(),
        ),
        child: AppView(appRouter: appRouter),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key, required this.appRouter});
  final RespiroRouter appRouter;
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      buildWhen: (previous, current) {
        return previous.themeMode != current.themeMode || 
               previous.customThemeEnabled != current.customThemeEnabled;
      },
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Respiro',
          debugShowCheckedModeBanner: false,
          themeMode: state.customThemeEnabled ? state.themeMode : ThemeMode.system,
          theme: RespiroTheme.lightTheme,
          darkTheme: RespiroTheme.darkTheme,
          routerConfig: appRouter.router,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
        );
      },
    );
  }
}
