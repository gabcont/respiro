import 'package:flutter/material.dart';


class HomeBarActions extends StatelessWidget {
  const HomeBarActions({
    super.key,
    required this.onPreferencesPressed
  });

  final VoidCallback onPreferencesPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        IconButton(
          onPressed: onPreferencesPressed,
          tooltip: 'Ajustes', // LANGT
          icon: Icon(Icons.settings),
        ),
        
      ],
    );
  }
}


