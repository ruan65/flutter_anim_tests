import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimOneScreen extends StatefulWidget {
  @override
  _AnimOneScreenState createState() => _AnimOneScreenState();
}

class _AnimOneScreenState extends State<AnimOneScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
    );

    final curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.elasticIn,
        reverseCurve: Curves.elasticOut);

    _animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            print('anim status: $status');
            if (status == AnimationStatus.completed) {
              animController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animController.forward();
            }
          });
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.rotate(
          angle: _animation.value, //          angle: _animation.value,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
