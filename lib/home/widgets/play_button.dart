
import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: 'Iniciar sesión de respiración',
      icon: Icon(
        Icons.play_circle,
        size: 100,
        fill: 0.0,
        grade: 0.1,
      )
    );
  }
}