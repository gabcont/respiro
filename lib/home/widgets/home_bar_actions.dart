import 'package:flutter/material.dart';
import 'package:respiro/l10n/generated/app_localizations.dart';

class HomeBarActions extends StatelessWidget {
  const HomeBarActions({
    super.key,
    required this.onPreferencesPressed
  });

  final VoidCallback onPreferencesPressed;

  @override
  Widget build(BuildContext context) {
    final lcl = AppLocalizations.of(context)!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        IconButton(
          onPressed: onPreferencesPressed,
          tooltip: lcl.preferencesTooltip, 
          icon: Icon(Icons.settings),
        ),
        
      ],
    );
  }
}


