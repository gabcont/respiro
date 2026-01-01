import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:respiro/home/view/library_page.dart';
import 'package:respiro/home/view/preview_page.dart';
import 'package:respiro/home/widgets/aurora_background.dart';

import 'package:respiro/home/widgets/widgets.dart';
import 'package:respiro/home/cubit/home_cubit.dart';
import 'package:respiro/l10n/generated/app_localizations.dart';

import 'package:respiro/profiles/profiles.dart';
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
  late final TabController _tabController = TabController(length: 2, vsync: this);
  late Widget? backgroundWidget = null;

  @override
  void initState() {
    super.initState();
    backgroundWidget = AuroraBackground();
    _selectedTabIndex = 0;
  }

  void _onProfileSelected(BuildContext context, int index, BreathingProfile profile) {
    context.read<HomeCubit>().onProfileSelected(index);
    setState(() {
      backgroundWidget = AuroraBackground(
        aurorasRequested: _requestProfileAuroras(
          profile,
        ),
      );
      //_selectedTabIndex = 0;
      //_tabController.animateTo(0);
    });
  }

  void _onPreferencesPressed(BuildContext context) {
    context.read<HomeCubit>().onPreferencesPressed();
  }

  void _onNavBarDestinationSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
      //_tabController.animateTo(index);
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
            //backgroundColor : Colors.transparent,
          /*  shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ), */
            centerTitle: true,
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                //color: Theme.of(context).colorScheme.primaryContainer,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(lcl!.appName),
            ),
            
            actions: [
              Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                //color: Theme.of(context).colorScheme.primaryContainer,
              ),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: HomeBarActions(
                onPreferencesPressed: () => _onPreferencesPressed(context),
              ),
              )
            ],
          ),
          /* body: Stack(
            children: [
              AuroraBackground(),
              TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  PreviewPage(),
                  LibraryPage(),
                ],
              ),
            ],
          ), */
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
              <Widget>[
                PreviewPage(),
                LibraryPage(
                  onProfileSelected: _onProfileSelected,
                ),
              ][_selectedTabIndex],
            ]
          ),
        );
      }
    );
  }

  List<AuroraRequest> _requestProfileAuroras(BreathingProfile? profile) {
    if (profile == null) {
      return [];
    }
    //print(profile);
    return profile.steps.map((step) {
      return AuroraRequest(
        size: step.duration * 30,
        color: switch (step.type) {
          StepType.inhale => Theme.of(context).extension<BreathingColors>()!.inhalePrimary!,
          StepType.exhale => Theme.of(context).extension<BreathingColors>()!.exhalePrimary!,
          StepType.hold => Theme.of(context).extension<BreathingColors>()!.holdPrimary!,
        },
      );
    }).toList();
  }
}