import 'package:flutter/material.dart';

class Dockhandle extends StatelessWidget {
  const Dockhandle({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.02, bottom: screenHeight * 0.02),
      child: Container(
        width: 40, 
        height: 5, 
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface, 
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }
}