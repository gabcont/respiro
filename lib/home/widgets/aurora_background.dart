import 'dart:math';
import 'package:flutter/material.dart';

const clampRadius = 5.0;

int auroraCount = 0;
List<Point<double>> auroraPositions = [];
List<Point<double>> auroraMovementVector = [];
List<int> auroraSpeeds = [];
List<double> auroraSizes = [];
List<Color> auroraColors = [];

void clearAuroras() {
  auroraCount = 0;
  auroraPositions.clear();
  auroraMovementVector.clear();
  auroraSpeeds.clear();
  auroraSizes.clear();
  auroraColors.clear();
}

int addAurora(Point<double> pos, Point<double> movementVector, int speed, double size, Color color) {
  auroraPositions.add(pos);
  auroraMovementVector.add(movementVector * speed.toDouble());
  auroraSpeeds.add(speed);
  auroraSizes.add(size);
  auroraColors.add(color);
  return ++auroraCount;
}

void initRandomAurora(Point<double>? pos, Point<double>? movementVector, int? speed, double? size, Color? color) {
  pos ??= Point(
      Random().nextDouble() * 400, // Assuming a default width
      Random().nextDouble() * 800  // Assuming a default height
  );
  movementVector ??= Point(
      (Random().nextDouble() - 0.5) * 2, // Random x movement between -1 and 1
      (Random().nextDouble() - 0.5) * 2  // Random y movement between -1 and 1
  );
  speed ??= 1 + Random().nextInt(2); // Speed between 1 and 5
  size ??= 50 + Random().nextDouble() * 100; // Size between
  color ??= Colors.primaries[Random().nextInt(Colors.primaries.length)];
  addAurora(pos, movementVector, speed, size, color);
}

void addRequestedAuroras(List<AuroraRequest>? requests) {
  if (requests == null) return;
  for (var request in requests) {
    initRandomAurora(
      request.position,
      request.movementVector,
      request.speed,
      request.size,
      request.color,
    );
  }
}

class AuroraRequest {
  final Point<double>? position;
  final Point<double>? movementVector;
  final int? speed;
  final double? size;
  final Color? color;

  AuroraRequest({
    this.position,
    this.movementVector,
    this.speed,
    this.size,
    this.color,
  });
}

class AuroraBackground extends StatefulWidget {

  final List<AuroraRequest>? aurorasRequested;   
  
  const AuroraBackground({
    super.key,
    this.aurorasRequested,
  });

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    clearAuroras(); // Limpiar auroras anteriores al iniciar
    if (widget.aurorasRequested != null && widget.aurorasRequested!.isNotEmpty) {
      addRequestedAuroras(widget.aurorasRequested);
    } else {
      // Si no hay peticiones, añadir algunas por defecto
      initRandomAurora(null, null, null, null, Colors.blue);
      initRandomAurora(null, null, null, null, Colors.red);
      initRandomAurora(null, null, null, null, Colors.green);
    }
    
    // Un solo controlador para manejar el "tiempo" de la animación
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void didUpdateWidget(AuroraBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.aurorasRequested != oldWidget.aurorasRequested) {
      clearAuroras();
      if (widget.aurorasRequested != null && widget.aurorasRequested!.isNotEmpty) {
        addRequestedAuroras(widget.aurorasRequested);
      } else {
        initRandomAurora(null, null, null, null, Colors.blue);
        initRandomAurora(null, null, null, null, Colors.red);
        initRandomAurora(null, null, null, null, Colors.green);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder reconstruye solo el CustomPaint, no toda la pantalla
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          // Pasamos el valor de la animación (0.0 a 1.0) al painter
          painter: AuroraPainter(
            animationValue: _controller.value,
            context: context,
            blurIntensity: 20,
          ),
        );
      },
    );
  }
}

// TODO: Ajustar tamaños y posiciones para diferentes tamaños de pantalla
// TODO: Abstraer la lógica de animación para permitir diferentes velocidades o patrones
class AuroraPainter extends CustomPainter {
  final double animationValue;
  final BuildContext context;
  final double blurIntensity;

  AuroraPainter({
    required this.animationValue, 
    required this.context,
    required this.blurIntensity,
    });

  @override
  void paint(Canvas canvas, Size size) {

    // Paint background
    final bgPaint = Paint()..color = Theme.of(context).colorScheme.surfaceContainer;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);
    final blurPaint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurIntensity);

    // Update positions
    for(int i = 0; i < auroraCount; i++) {
      auroraPositions[i] += auroraMovementVector[i];
      
      // Check X axis
      if (auroraPositions[i].x < 0 || auroraPositions[i].x > size.width) {
        /* print(size);
        print(auroraPositions[i]); */
        auroraMovementVector[i] = Point(-auroraMovementVector[i].x, auroraMovementVector[i].y);
        
        // Clamp to avoid getting stuck
        double clampedX = auroraPositions[i].x;
        if (auroraPositions[i].x < 0) clampedX = clampRadius;
        if (auroraPositions[i].x > size.width) clampedX = size.width - clampRadius;
        auroraPositions[i] = Point(clampedX, auroraPositions[i].y);
      } 

      // Check Y axis
      if (auroraPositions[i].y < 0 || auroraPositions[i].y > size.height) {
        auroraMovementVector[i] = Point(auroraMovementVector[i].x, -auroraMovementVector[i].y);
        
        // Clamp to avoid getting stuck
        double clampedY = auroraPositions[i].y;
        if (auroraPositions[i].y < 0) clampedY = clampRadius;
        if (auroraPositions[i].y > size.height) clampedY = size.height - clampRadius;
        auroraPositions[i] = Point(auroraPositions[i].x, clampedY);
      }
    }

    // Draw Images
    for(int i = 0; i < auroraCount; i++) {
      blurPaint.color = auroraColors[i].withAlpha(125);
      canvas.drawCircle(
        Offset(auroraPositions[i].x, auroraPositions[i].y), 
        auroraSizes[i], 
        blurPaint
      );
    }
  }

  @override
  bool shouldRepaint(covariant AuroraPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}