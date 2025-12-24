import 'package:flutter/material.dart';

class SessionActionButtons extends StatelessWidget {
  
  final bool isPaused;
  final VoidCallback onPaused;
  final VoidCallback onResumed;
  final VoidCallback onReseted;
  final VoidCallback onCanceled;
  
  const SessionActionButtons({
    super.key,
    required this.isPaused,
    required this.onResumed,
    required this.onPaused,
    required this.onCanceled,
    required this.onReseted,
  });

  @override
  Widget build(BuildContext context) {
    final bool showExtraControls = isPaused;

    return Row(
            mainAxisSize: MainAxisSize.min, // Importante: se ajusta al contenido
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              _AnimatedSideButton(
                isVisible: showExtraControls,
                icon: Icons.close,
                color: Theme.of(context).colorScheme.error, // Color suave MD3
                iconColor: Theme.of(context).colorScheme.onError,
                onPressed: onCanceled,
                heroTag: 'exit_btn',
              ),
      
              _AnimatedGap(isVisible: showExtraControls),
      
              FloatingActionButton.large(
                heroTag: 'main_control_btn',
                shape: isPaused ? CircleBorder() : RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  if (isPaused) {
                    onResumed();
                  } else {
                    onPaused();
                  }
                },

                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, anim) => RotationTransition(
                    turns: child.key == const ValueKey('icon_pause') 
                        ? Tween<double>(begin: 0.75, end: 1).animate(anim) 
                        : Tween<double>(begin: 0.75, end: 1).animate(anim),
                    child: ScaleTransition(scale: anim, child: child),
                  ),
                  child: Icon(
                    isPaused ? Icons.play_arrow : Icons.pause,
                    key: ValueKey(isPaused ? 'icon_play' : 'icon_pause'),
                    size: 36,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
      
              _AnimatedGap(isVisible: showExtraControls),
      
              _AnimatedSideButton(
                isVisible: showExtraControls,
                icon: Icons.replay,
                color: Theme.of(context).colorScheme.primary,
                iconColor: Theme.of(context).colorScheme.onPrimary,
                onPressed: onReseted,
                heroTag: 'reset_btn',
              ),
            ],
        ); 
      }
}

class _AnimatedSideButton extends StatelessWidget {
  final bool isVisible;
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final Color iconColor;
  final String heroTag;

  const _AnimatedSideButton({
    required this.isVisible,
    required this.icon,
    required this.onPressed,
    required this.color,
    required this.iconColor,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Tamaños dinamicos
    final double targetWidth = isVisible ? 60 : 0; // Fixed: 0 when not visible
    return SizedBox( 
      width: targetWidth,
      height: 60,
      child: isVisible  
       ? Center( 
            child: AnimatedScale(
              scale: isVisible ? 1.0 : 0.5,
              duration: const Duration(milliseconds: 300),
              child: FloatingActionButton( 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                heroTag: heroTag,
                backgroundColor: color,
                elevation: 10,
                onPressed: isVisible ? onPressed : null,
                child: Icon(icon, color: iconColor),
              ),
            ),
          )
      : null,
    );
  }
}

class _AnimatedGap extends StatelessWidget {
  final bool isVisible;
  const _AnimatedGap({required this.isVisible});

  @override
  Widget build(BuildContext context) {
    // TODO: Tamaños dinamicos
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      width: isVisible ? 20 : 0, // Espacio entre botones
    );
  }
}