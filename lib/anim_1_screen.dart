import 'dart:math' as math;

import 'package:fl_anim_tests/animated_widget_page.dart';
import 'package:flutter/material.dart';

class AnimOneScreen extends StatefulWidget {
  String testString = 'test string';

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
      duration: Duration(milliseconds: 3000),
    );

    final curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.elasticIn,
        reverseCurve: Curves.elasticOut);

    _animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(curvedAnimation)
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
        child: RotatingTransition(
            angle: _animation, child: getSquare(Colors.redAccent)),
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
