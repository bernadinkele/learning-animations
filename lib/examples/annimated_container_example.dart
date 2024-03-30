import 'package:flutter/material.dart';

class AnnimatedContainerExample extends StatefulWidget {
  const AnnimatedContainerExample({super.key});
  @override
  State<AnnimatedContainerExample> createState() =>
      _AnnimatedContainerExampleState();
}

class _AnnimatedContainerExampleState extends State<AnnimatedContainerExample> {
  @override
  void initState() {
    super.initState();
    lunchAnimation();
  }

  bool _show = false;

  lunchAnimation() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2), () {
        _update();
      });
    }
  }

  void _update() {
    setState(() {
      _show = !_show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            height: _show ? 0 : MediaQuery.of(context).size.height,
            width: _show ? 0 : MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.red),
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );
  }
}
