import 'package:flutter/material.dart';
import 'package:respiro/routines/routines.dart';


class BreathingProfileCard extends StatelessWidget {

  final Routine profile;
  final VoidCallback onTap;
  final double maxWidth;

  const BreathingProfileCard({
    super.key,
    required this.profile,
    required this.onTap,
    this.maxWidth = 600.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Card(
            color: Theme.of(context).colorScheme.surfaceBright,
            surfaceTintColor: Colors.primaries[(profile.id * 3) % Colors.primaries.length],
            elevation: 4,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(12),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Si la altura disponible es poca, usamos el layout compacto
                  if (constraints.maxHeight < 200) {
                    return _buildCompactLayout(context);
                  }
                  return _buildExpandedLayout(context);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Usar fl_chart para agregar visualización del perfil.
  Widget _stepPreview(SequenceStep step) {

    Alignment alignment;
    Color color;
    IconData icon;

    switch (step.type) {
        case StepType.inhale: 
          alignment = Alignment.bottomCenter;
          color = Colors.lightBlue;
          icon = Icons.arrow_circle_up_rounded;
          break;
        case StepType.exhale:
          alignment = Alignment.topCenter;
          color = Colors.amber;
          icon = Icons.arrow_circle_down_rounded;
          break;
        case StepType.hold: 
          alignment = Alignment.center;
          color = Colors.grey;
          icon = Icons.arrow_circle_right_rounded;
          break;
        case StepType.meditate:
          alignment = Alignment.center;
          color = Colors.purple;
          icon = Icons.self_improvement;
          break;
    }
    return Align(
      alignment: alignment,
      child: Container(
        width: 30,
        //height: (step.duration / 10) * 100, // Escalamos la altura
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        /* decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: color,
        ), */
        child: Icon(
          icon,
          color: color,
          fill: 0.1,
          opticalSize: step.stepDuration * 10.0,
          ),
      ),
    );
  }


  Widget _buildCompactLayout(BuildContext context) {
    final steps = profile.phases.isNotEmpty ? profile.phases.first.sequence?.steps ?? [] : <SequenceStep>[];
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              profile.rawName ?? '',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: steps.map(_stepPreview).toList(),
            ),
          )
        ]
      ),
    );
  }

  // TODO: Cambiar color de acento de la app según el perfil seleccionado.
  // TODO: Agregar arte generativo de fondo con colores únicos por perfil y efecto parallax.
  // TODO: Agregar pestañas con Descripción, Beneficios, Técnica.
  // TODO: Agregar preview.
  Widget _buildExpandedLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                profile.rawName ?? '',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Text(
              profile.rawLongDescription ?? '',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}