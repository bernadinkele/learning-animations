import 'package:flutter/material.dart';

class AnimatedBuilderExample1 extends StatefulWidget {
  const AnimatedBuilderExample1({super.key});

  @override
  State<AnimatedBuilderExample1> createState() =>
      _AnimatedBuilderExample1State();
}

class _AnimatedBuilderExample1State extends State<AnimatedBuilderExample1>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      animationBehavior: AnimationBehavior.preserve,
    )..repeat(reverse: true);
    _animation = Tween(begin: -1.0, end: 0.0).animate(_controller);
   // _animation = ColorTween(end: Colors.red, begin: Colors.white)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.skewX(_animation.value),
              child: child,
            );
          },
          child: const FlutterLogo(size: 300),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
