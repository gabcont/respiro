import 'package:flutter/material.dart';

import 'package:respiro/home/widgets/widgets.dart';

import 'package:respiro/profiles/profiles.dart';


class CollapsedDock extends StatelessWidget {
  
  final BreathingProfile? selectedProfile;
  final double screenHeight;
  
  const CollapsedDock({
    super.key, 
    this.selectedProfile,
    required this.screenHeight,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer, // Un color que resalte
        border: Border.all(color: Theme.of(context).colorScheme.surfaceContainer),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Dockhandle(screenHeight: screenHeight),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.keyboard_arrow_up),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Perfil seleccionado:",
                        style: Theme.of(context).textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        // Si es null, muestra un texto por defecto
                        selectedProfile?.title ?? "Selecciona un perfil",
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // const Spacer(), // Removed Spacer as Expanded takes available space
              ]
            ),
          ),
        ],
      ),
    );
  }
}

class CompleteProfileList extends StatelessWidget {

  final List<BreathingProfile> profiles;
  final double screenHeight;
  final VoidCallback onProfileSelected;

  const CompleteProfileList({
    super.key,
    required this.profiles,
    required this.screenHeight,
    required this.onProfileSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        border: Border.all(color: Theme.of(context).colorScheme.surfaceContainer),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Column(
        children: [
          // Una pequeña muesca visual para indicar que se puede arrastrar
          Dockhandle(screenHeight: screenHeight,),
          Text("Perfiles Disponibles", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profile = profiles[index];
                return ProfileCard(
                  profile: profile,
                  onPressed: onProfileSelected,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
