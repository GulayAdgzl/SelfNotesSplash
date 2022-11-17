import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  final String path;

  const Splash({super.key, required this.path});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: _DurationUtility._durationLow)
        ..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 0.08),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //Image.asset('assets/kar.png'),
      SlideTransition(
          position: _animation,
          child: Lottie.asset("assets/${widget.path}.json")),
    ]);
    //Lottie.asset("assets/${widget.path}.json");
  }
}

class _DurationUtility {
  static const _durationLow = const Duration(seconds: 3);
}
