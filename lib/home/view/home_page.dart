import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:respiro/home/view/library_page.dart';
import 'package:respiro/home/view/preview_page.dart';
import 'package:respiro/home/widgets/aurora_background.dart';

import 'package:respiro/home/widgets/widgets.dart';
import 'package:respiro/home/cubit/home_cubit.dart';
import 'package:respiro/l10n/generated/app_localizations.dart';

import 'package:respiro/routines/routines.dart';
import 'package:respiro/theme/cubit/theme_cubit.dart';
import 'package:respiro/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends StatefulWidget {

  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {

  late int _selectedTabIndex;
  late Widget? backgroundWidget;
  late final List<ThemeData> routineslightThemes, routinesDarkThemes; 

  @override
  void initState() {
    super.initState();
    backgroundWidget = AuroraBackground();
    _selectedTabIndex = 0;
    _createRoutinesThemes();
  }

  void _onProfileSelected(BuildContext context, int index, Routine routine) {
    context.read<HomeCubit>().onProfileSelected(index);
    context.read<ThemeCubit>().updateThemeData(
      routineslightThemes[index],
      routinesDarkThemes[index],
    );
    setState(() {
      //print('Requesting auroras for routine: ${routine.rawName}');
      backgroundWidget = AuroraBackground(
        aurorasRequested: _requestProfileAuroras(
          routine,
        ),
      );
    });
  }

  void _onPreferencesPressed(BuildContext context) {
    context.read<HomeCubit>().onPreferencesPressed();
  }

  void _onNavBarDestinationSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lcl = AppLocalizations.of(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            forceMaterialTransparency: true,
            actionsPadding: EdgeInsets.only(right: 8),
            centerTitle: true,
            title: Text(lcl!.appName),
            actions: [
              HomeBarActions(
                onPreferencesPressed: () => _onPreferencesPressed(context),
              ),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.transparent,
            animationDuration: Duration(milliseconds: 1000),
            selectedIndex: _selectedTabIndex,
            onDestinationSelected: (index) => _onNavBarDestinationSelected(index),
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'), 
              //NavigationDestination(icon: Icon(Icons.track_changes), label: 'Transition'), 
            ] 
          ),
          body: Stack(
            children:[
              backgroundWidget ?? Container(),
              // TODO: Agregar animación de transición entre tabs
              Positioned.fill(
                child: IndexedStack(
                  index: _selectedTabIndex,
                  children: <Widget>[
                    PreviewPage(),
                    LibraryPage(
                      onProfileSelected: _onProfileSelected,
                      routinesLightThemes: routineslightThemes,
                      routinesDarkThemes: routinesDarkThemes,
                    ),
                  ],
                ),
              ),
            ]
          ),
        );
      }
    );
  }

  List<AuroraRequest> _requestProfileAuroras(Routine? routine) {
    if (routine == null) {
      return [];
    }
    //print(profile);
    final steps = routine.phases.isNotEmpty
        ? routine.phases
            .map((phase) => phase.sequence!.steps)
            .expand((steps) => steps)
            .toList()
        : <SequenceStep>[];
    final breathing = Theme.of(context).extension<BreathingColors>();
    final fallback = Theme.of(context).colorScheme.primary;

    return steps.map((step) {
      return AuroraRequest(
        size: clampDouble(step.stepDuration * 0.025, 50, 250),
        color: switch (step.type) {
          StepType.inhale => breathing?.inhalePrimary ?? fallback,
          StepType.exhale => breathing?.exhalePrimary ?? fallback,
          StepType.hold => breathing?.holdPrimary ?? fallback,
          StepType.meditate => breathing?.meditatePrimary ?? fallback,
        },
      );
    }).toList();
  }
  
  void _createRoutinesThemes() {
    final Random random = Random();
    final routineNumber = Colors.primaries.length;
    routineslightThemes = List<ThemeData>.generate(
      routineNumber,
      (index) {
        final seed = Colors.primaries[random.nextInt(Colors.primaries.length)];
        return RespiroTheme.lightTheme.copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: seed,
            brightness: Brightness.light,
          ),
        );
      },
    );
    routinesDarkThemes = List<ThemeData>.generate(
      routineNumber,
      (index) {
        final seed = Colors.primaries[random.nextInt(Colors.primaries.length)];
        return RespiroTheme.darkTheme.copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: seed,
            brightness: Brightness.dark,
          ),
        );
      },
    );
  }
}