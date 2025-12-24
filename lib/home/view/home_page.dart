import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:respiro/home/widgets/widgets.dart';
import 'package:respiro/home/cubit/home_cubit.dart';

import 'package:respiro/profiles/profiles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final PanelController _panelController = PanelController();

  void _onProfileCardPressed() {
    _panelController.close();    
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double screenHeight = mediaQuery.size.height;
    bool isPanelOpen = false;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.loading:
            return CircularProgressIndicator();
          case HomeStatus.loaded:
            BreathingProfile currentProfile =
                state.breathingProfiles[state.selectedProfile];
            return PopScope(
              canPop: !isPanelOpen,
              child: SafeArea(
                child: SlidingUpPanel(

                  // CONFIGURATION
                  controller: _panelController,
                  renderPanelSheet: false,
                  maxHeight:screenHeight * 0.9, // Se expande al 90% de la pantalla
                  minHeight: screenHeight * 0.175, // Altura cuando está abajo
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                  parallaxEnabled: true, // Efecto visual bonito al arrastrar
                  parallaxOffset: .1,
                  onPanelClosed: () => setState(() {
                    isPanelOpen = false;
                  }),
                  onPanelOpened: () => setState(() {
                    isPanelOpen = true;
                  }),
                  
                  // WIDGETS 

                  body: HomeBody(
                    selectedProfile: currentProfile
                  ),
                  
                  collapsed: CollapsedDock(
                    selectedProfile: currentProfile, 
                    screenHeight: screenHeight,
                  ),
                  
                  panel: CompleteProfileList(
                    profiles: state.breathingProfiles,
                    screenHeight: screenHeight,
                    onProfileSelected: () => _onProfileCardPressed(),
                  ),

                ),
              ),
            );
        }
      },
    );
  }
}