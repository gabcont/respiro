
import 'package:flutter/material.dart';

class SessionBackground extends StatelessWidget {
  const SessionBackground({
    super.key,
    required this.backgroundColor,
    required this.backgroundKey,
  });

  final Color backgroundColor;
  final GlobalKey backgroundKey;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: TweenAnimationBuilder(
        tween: ColorTween(
          begin: Colors.black12,
          end: backgroundColor
        ),
        duration: Duration(milliseconds: 300),
        builder: (context, value, child) => Ink(
          key: backgroundKey,
          color: value,
        ),
      ),
    );
  }
}