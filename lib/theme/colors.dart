import 'package:flutter/material.dart';

@immutable
class BreathingColors extends ThemeExtension<BreathingColors> {
  const BreathingColors({
    required this.inhale,
    required this.hold,
    required this.exhale,
  });

  final Color? inhale;
  final Color? hold;
  final Color? exhale;

  @override
  BreathingColors copyWith({
    Color? inhale,
    Color? hold,
    Color? exhale,
  }) {
    return BreathingColors(
      inhale: inhale ?? this.inhale,
      hold: hold ?? this.hold,
      exhale: exhale ?? this.exhale,
    );
  }

  @override
  BreathingColors lerp(ThemeExtension<BreathingColors>? other, double t) {
    if (other is! BreathingColors) {
      return this;
    }
    return BreathingColors(
      inhale: Color.lerp(inhale, other.inhale, t),
      hold: Color.lerp(hold, other.hold, t),
      exhale: Color.lerp(exhale, other.exhale, t),
    );
  }

  // Valores por defecto sugeridos
  static const light = BreathingColors(
    inhale: Color.fromARGB(255, 84, 146, 254),
    exhale: Color(0xFFFFAB40),
    hold: Color(0xFF607D8B),
  );

  static const dark = BreathingColors(
    // En modo oscuro, Material recomienda usar tonos más claros (200) 
    // para asegurar suficiente contraste y reducir la fatiga visual.
    inhale: Color(0xFF283250), // Blue 200
    exhale: Color(0xFF513b22),   // Orange 200
    hold: Color(0xFF282f33), // BlueGrey 200
  );
}
