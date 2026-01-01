import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:respiro/l10n/generated/app_localizations.dart';
import 'package:respiro/app/router/router.dart';
import 'package:respiro/theme/cubit/theme_cubit.dart';
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PreferencesCubit(
              soundService: context.read<SoundService>(),
              profilesRepository: context.read<ProfilesRepository>(),
              preferencesRepository: context.read<PreferencesRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(context.read<PreferencesCubit>().state.themeMode),
          ),
        ],
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
    final locale = context.select((PreferencesCubit cubit) => cubit.state.locale);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          // APP
          title: 'Respiro',
          debugShowCheckedModeBanner: false,

          // THEME
          themeMode: state.themeMode,
          theme: state.lightThemeData,
          darkTheme: state.darkThemeData,

          // LOCALE
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],

          // ROUTER
          routerConfig: appRouter.router,
        );
      },
    );
  }
}
