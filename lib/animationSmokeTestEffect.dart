import 'package:demo_flutter_app/animationLetter.dart';
import 'package:flutter/widgets.dart';

class AnimatedSmokeTextEffect extends StatefulWidget {
  @override
  _AnimatedSmokeTextEffectState createState() =>
      _AnimatedSmokeTextEffectState();
}

class _AnimatedSmokeTextEffectState extends State<AnimatedSmokeTextEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Adjust the total animation duration
    );

    // Create intervals for staggered delays
    final interval = 0.4;
    final delays = [0.6, 1.0, 1.7, 2.3, 2.7];

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });

    // Apply delays based on the index
    for (int i = 0; i < delays.length; i++) {
      Future.delayed(Duration(seconds: (delays[i] / interval).round()), () {
        _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedLetter(text: 'A', animation: _animation),
        AnimatedLetter(text: 'R', animation: _animation),
        AnimatedLetter(text: 'Y', animation: _animation),
        AnimatedLetter(text: 'A', animation: _animation),
        AnimatedLetter(text: 'N', animation: _animation),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
