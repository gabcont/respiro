import 'package:flutter/material.dart';

import 'package:respiro/profiles/profiles.dart';

class SessionBody extends StatelessWidget {
  const SessionBody({
    super.key,
    required this.minutes,
    required this.seconds,
    required this.step,
    required this.stepSecondsRemaining,
    required AnimationController controller,
  }) : _controller = controller;

  final String minutes;
  final String seconds;
  final BreathingStep step;
  final double stepSecondsRemaining;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    final stepActionMessage = switch(step.type) {
      StepType.inhale => 'Inhala',
      StepType.exhale => 'Exhala',
      StepType.hold => 'Mantén la respiración',
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculamos tamaños dinámicos basados en el espacio disponible
        final double availableWidth = constraints.maxWidth;
        final double availableHeight = constraints.maxHeight;
        
        // El indicador ocupará un porcentaje del ancho o alto, lo que sea menor
        final bool isPortrait = availableHeight >= availableWidth;
        final double indicatorSize = (isPortrait ? availableWidth : availableHeight) * 0.6;
        
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Tiempo restante
              const Text('Tiempo restante:'),
              SizedBox(height: availableHeight * 0.01),
              Text(
                '$minutes:$seconds',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              
              const Spacer(flex: 2),
              
              // Mensaje de estado
              Text(
                    stepActionMessage,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: availableWidth * 0.08, // Fuente dinámica
                    ),
                    textAlign: TextAlign.center,
              ),
              
              const Spacer(flex: 3),

              Text(
                    step.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
              ),

              const Spacer(flex: 3),
              
              SizedBox(
                width: indicatorSize,
                height: indicatorSize,
                child: AnimatedBuilder(
                  animation: _controller, 
                  builder: (context, child) {
                    double value = _controller.value;
                    return switch (step.type) 
                    {
                      StepType.inhale => InhaleIndicator(value: value, size: indicatorSize),
                      StepType.exhale => ExhaleIndicator(value: value, size: indicatorSize),
                      StepType.hold => HoldIndicator(value: value, size: indicatorSize),
                    };
                  },
                ),
              ),
        
              const Spacer(flex: 5), // Espacio extra abajo para los controles
            ],
          ),
        );
      }
    );
  }
}

class ExhaleIndicator extends StatelessWidget {
  
  final double value;
  final double size;
  
  const ExhaleIndicator({
    super.key,
    required this.value,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: SizedBox(
            width: size,
            height: size / 5,
            child: LinearProgressIndicator(
              value: value,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}

class HoldIndicator extends StatelessWidget {
  const HoldIndicator({
    super.key,
    required this.value,
    required this.size,
  });

  final double value;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
        ),
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            value: value,
            strokeCap: StrokeCap.round,
            strokeWidth: size / 10,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ],
    );
  }
}

class InhaleIndicator extends StatelessWidget {
  
  final double value;
  final double size;
  
  const InhaleIndicator({
    super.key,
    required this.value,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: SizedBox(
            width: size,
            height: size / 5,
            child: LinearProgressIndicator(
              value: value,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}