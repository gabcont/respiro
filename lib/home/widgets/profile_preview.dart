import 'package:flutter/material.dart';
import 'package:respiro/l10n/generated/app_localizations.dart';

import 'package:respiro/routines/routines.dart';

class ProfilePreviewCard extends StatelessWidget {
  
  final Routine? profile;
  final bool isPortrait;
  final Widget playButton;

  const ProfilePreviewCard({
    super.key,
    required this.profile,
    required this.isPortrait,
    required this.playButton,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Tamaños dinamicos
    final lcl = AppLocalizations.of(context)!;
    final mainContent = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          profile?.rawName ?? lcl.noProfileSelected, 
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        if (profile != null)
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            runSpacing: 8.0,
            children: (profile!.phases.isNotEmpty ? profile!.phases.first.sequence?.steps ?? [] : <SequenceStep>[]).map((step) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                // TODO: Verificar que no se pase de 60s y mostrar en min si es necesario
                "${step.stepDuration.toInt()} ${lcl.secondsAbbreviation}",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: switch (step.type) {
                    // TODO: Usar colores del tema 
                    StepType.inhale => Colors.lightBlueAccent,
                    StepType.hold => Colors.grey,
                    StepType.exhale => Colors.redAccent,
                    StepType.meditate => Colors.purpleAccent,
                  },
                ),
              ),
            )).toList(),
          ),
        const SizedBox(height: 24),
        Text(
          profile?.rawLongDescription ?? lcl.pleaseSelectProfile,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );

    return Card(
      // TODO: Tamaños dinamicos
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: !isPortrait 
          ? Row( 
              children: [
                Expanded(child: mainContent),
                const SizedBox(width: 24),
                playButton,
              ],
            )
          : Column( 
              mainAxisSize: MainAxisSize.min,
              children: [
                mainContent,
                const SizedBox(height: 24),
                playButton,
              ],
            ),
      ),
    );
  }
}
