import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonView extends StatefulWidget {
  const ButtonView({super.key});

  @override
  State<ButtonView> createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(microseconds: 300),
        reverseDuration: Duration(microseconds: 275));
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
        reverseCurve: Curves.easeIn);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Alignment alignment1 = Alignment(0.0, 0.0);
  Alignment alignment2 = Alignment(0.0, 0.0);
  double size1 = 50.0;
  double size2 = 50.0;

  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          height: 250,
          width: 250,
          child: Stack(children: [
            AnimatedAlign(
              duration: toggle
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              alignment: alignment1,
              curve: toggle ? Curves.easeIn : Curves.easeOut,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 275),
                  curve: toggle ? Curves.easeIn : Curves.easeOut,
                  height: size1,
                  width: size1,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(40.0)),
                  child: Image.asset('assets/icon/signup.png')),
            ),
            AnimatedAlign(
              duration: toggle
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              alignment: alignment2,
              curve: toggle ? Curves.easeIn : Curves.easeOut,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 275),
                  curve: toggle ? Curves.easeIn : Curves.easeOut,
                  height: size2,
                  width: size2,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(40.0)),
                  child: Image.asset('assets/icon/login.png')),
            ),
            Align(
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: _animation.value * pi * (3 / 4),
                child: AnimatedContainer(
                  duration: Duration(microseconds: 375),
                  curve: Curves.easeOut,
                  height: toggle ? 70.0 : 60.0,
                  width: toggle ? 70.0 : 60.0,
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(60.0)),
                  child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                          splashColor: Colors.white,
                          splashRadius: 31.0,
                          onPressed: () {
                            if (toggle) {
                              toggle = !toggle;
                              _controller.forward();
                              Future.delayed(Duration(milliseconds: 10), () {
                                alignment1 = Alignment(-0.7, -0.4);
                                size1 = 50;
                              });
                              Future.delayed(Duration(milliseconds: 20), () {
                                alignment2 = Alignment(0.7, -0.4);
                                size2 = 50;
                              });
                            } else {
                              toggle = !toggle;
                              _controller.reverse();
                              alignment1 = Alignment(0.0, 0.0);
                              alignment2 = Alignment(0.0, 0.0);
                              size1 = size2 = 20.0;
                            }
                          },
                          icon: const Icon(Icons.home)
                          // Image.asset('assets/icon/signup.png', height: 27),
                          )),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
