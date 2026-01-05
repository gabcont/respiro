import 'package:flutter/material.dart';

@immutable
class BreathingColors extends ThemeExtension<BreathingColors> {
  const BreathingColors({
    required this.inhalePrimary,
    required this.inhaleSurface,
    required this.holdPrimary,
    required this.holdSurface,
    required this.exhalePrimary,
    required this.exhaleSurface,
    required this.meditatePrimary,
    required this.meditateSurface,
  });

  final Color? inhalePrimary;
  final Color? inhaleSurface;
  final Color? holdPrimary;
  final Color? holdSurface;
  final Color? exhalePrimary;
  final Color? exhaleSurface;
  final Color? meditatePrimary;
  final Color? meditateSurface;

  @override
  BreathingColors copyWith({
    Color? inhalePrimary,
    Color? inhaleSurface,
    Color? holdPrimary,
    Color? holdSurface,
    Color? exhalePrimary,
    Color? exhaleSurface,
    Color? meditatePrimary,
    Color? meditateSurface,
  }) {
    return BreathingColors(
      inhalePrimary: inhalePrimary ?? this.inhalePrimary,
      inhaleSurface: inhaleSurface ?? this.inhaleSurface,
      holdPrimary: holdPrimary ?? this.holdPrimary,
      holdSurface: holdSurface ?? this.holdSurface,
      exhalePrimary: exhalePrimary ?? this.exhalePrimary,
      exhaleSurface: exhaleSurface ?? this.exhaleSurface,
      meditatePrimary: meditatePrimary ?? this.meditatePrimary,
      meditateSurface: meditateSurface ?? this.meditateSurface,
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
      meditatePrimary: Color.lerp(meditatePrimary, other.exhaleSurface, t),
      meditateSurface: Color.lerp(meditateSurface, other.exhaleSurface, t),
    );
  }

  // Valores por defecto sugeridos
  static const light = BreathingColors(
    inhalePrimary: Color(0xFF42A5F5),
    inhaleSurface: Color(0xFFE3F2FD),
    exhalePrimary: Color(0xFFBA68C8),
    exhaleSurface: Color(0xFFFFF3E0),
    holdPrimary: Color(0xFFF06292),
    holdSurface: Color(0xFFECEFF1),
    meditatePrimary: Color.fromARGB(255, 104, 200, 114),
    meditateSurface: Color.fromARGB(255, 104, 200, 114),
  );

  static const dark = BreathingColors(
    // En modo oscuro, el primary es claro y vivo para contraste.
    // El surface es oscuro y profundo para no encandilar.
    inhalePrimary: Color(0xFF4FC3F7),
    inhaleSurface: Color(0xFF15202B),
    exhalePrimary: Color(0xFF26A69A),
    exhaleSurface: Color(0xFF2D2015),
    holdPrimary: Color(0xFF5C6BC0),
    holdSurface: Color(0xFF263238),
    meditatePrimary: Color.fromARGB(255, 104, 200, 114),
    meditateSurface: Color.fromARGB(255, 104, 200, 114),
  );


}
