
import 'package:flutter/material.dart';
import 'package:respiro/l10n/generated/app_localizations.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: Tamaños dinamicos
    final lcl = AppLocalizations.of(context)!;
    return IconButton(
      onPressed: onPressed,
      tooltip: lcl.startSessionTooltip,
      icon: Icon(
        Icons.play_circle,
        size: 100,
        fill: 0.0,
        grade: 0.1,
      )
    );
  }
}