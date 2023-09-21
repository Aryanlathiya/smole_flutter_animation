import 'package:flutter/material.dart';

class AnimatedLetter extends StatelessWidget {
  final String text;
  final Animation<double> animation;

  AnimatedLetter({required this.text, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value * 2.0 * 3.14159265359,
          child: Opacity(
            opacity: animation.value,
            child: Text(
              text,
              style: TextStyle(
                letterSpacing: 1.0,
                textBaseline: TextBaseline.alphabetic,
                color: Colors.white,
                fontSize: 50.0,
                fontFamily: 'sans-serif',
              ),
            ),
          ),
        );
      },
    );
  }
}
