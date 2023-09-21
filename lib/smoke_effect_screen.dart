import 'package:demo_flutter_app/animationSmokeTestEffect.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SmokeEffectScreen extends StatefulWidget {
  @override
  _SmokeEffectScreenState createState() => _SmokeEffectScreenState();
}

class _SmokeEffectScreenState extends State<SmokeEffectScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/smoke.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _controller.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : Container(),
          Center(
            child: AnimatedSmokeTextEffect(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
