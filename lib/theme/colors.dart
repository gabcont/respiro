import 'package:flutter/material.dart';

// TODO: Agregar colores para cada elemento que use colores personalizados en la app.

@immutable
class BreathingColors extends ThemeExtension<BreathingColors> {
  const BreathingColors({
    required this.inhalePrimary,
    required this.inhaleSurface,
    required this.holdPrimary,
    required this.holdSurface,
    required this.exhalePrimary,
    required this.exhaleSurface,
  });

  final Color? inhalePrimary;
  final Color? inhaleSurface;
  final Color? holdPrimary;
  final Color? holdSurface;
  final Color? exhalePrimary;
  final Color? exhaleSurface;

  @override
  BreathingColors copyWith({
    Color? inhalePrimary,
    Color? inhaleSurface,
    Color? holdPrimary,
    Color? holdSurface,
    Color? exhalePrimary,
    Color? exhaleSurface,
  }) {
    return BreathingColors(
      inhalePrimary: inhalePrimary ?? this.inhalePrimary,
      inhaleSurface: inhaleSurface ?? this.inhaleSurface,
      holdPrimary: holdPrimary ?? this.holdPrimary,
      holdSurface: holdSurface ?? this.holdSurface,
      exhalePrimary: exhalePrimary ?? this.exhalePrimary,
      exhaleSurface: exhaleSurface ?? this.exhaleSurface,
    );
  }

  @override
  BreathingColors lerp(ThemeExtension<BreathingColors>? other, double t) {
    if (other is! BreathingColors) {
      return this;
    }
    return BreathingColors(
      inhalePrimary: Color.lerp(inhalePrimary, other.inhalePrimary, t),
      inhaleSurface: Color.lerp(inhaleSurface, other.inhaleSurface, t),
      holdPrimary: Color.lerp(holdPrimary, other.holdPrimary, t),
      holdSurface: Color.lerp(holdSurface, other.holdSurface, t),
      exhalePrimary: Color.lerp(exhalePrimary, other.exhalePrimary, t),
      exhaleSurface: Color.lerp(exhaleSurface, other.exhaleSurface, t),
    );
  }

  // Valores por defecto sugeridos
  static const light = BreathingColors(
    inhalePrimary: Color.fromARGB(255, 109, 36, 234),
    inhaleSurface: Color(0xFFE3F2FD),
    exhalePrimary: Color.fromARGB(255, 255, 198, 64),
    exhaleSurface: Color(0xFFFFF3E0),
    holdPrimary: Color(0xFF607D8B),
    holdSurface: Color(0xFFECEFF1),
  );

  static const dark = BreathingColors(
    // En modo oscuro, el primary es claro y vivo para contraste.
    // El surface es oscuro y profundo para no encandilar.
    inhalePrimary: Color.fromARGB(255, 85, 146, 244),
    inhaleSurface: Color(0xFF15202B),
    exhalePrimary: Color.fromARGB(255, 231, 80, 30),
    exhaleSurface: Color(0xFF2D2015),
    holdPrimary: Color.fromARGB(255, 238, 238, 99),
    holdSurface: Color(0xFF263238),
  );


}
