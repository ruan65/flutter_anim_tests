import 'package:flutter/material.dart';

class RotatingTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> angle;

  const RotatingTransition({@required this.angle, @required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      child: child,
      builder: (context, child) {
        return Transform.rotate(
          angle: angle.value,
          child: child,
        );
      },
    );
  }
}

Widget getSquare(Color color) => Container(
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 100,
      width: 100,
    );
