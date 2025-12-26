
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:respiro/l10n/generated/app_localizations.dart';

class PauseOverlay extends StatelessWidget {
  const PauseOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final lcl = AppLocalizations.of(context)!;
    return Positioned.fill(
      // ClipRect es OBLIGATORIO aquí para que el blur no se salga 
      // de los bordes si el widget tiene esquinas redondeadas o márgenes.
      child: ClipRect( 
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0, tileMode: TileMode.mirror), // Intensidad del blur
          child: Container(
            // Es recomendable ponerle un tinte suave encima del blur
            // para que el texto de pausa se lea mejor.
            color: Colors.black.withAlpha(50),
            child: Center(child: Text(lcl.paused, style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white)),),
          ),
        ),
      ),
    );
  }
}
