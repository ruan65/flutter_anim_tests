import 'package:flutter/material.dart';

class AnimOneScreen extends StatefulWidget {
  String testString = 'test string';

  @override
  _AnimOneScreenState createState() => _AnimOneScreenState();
}

class _AnimOneScreenState extends State<AnimOneScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.orange,);
  }
}
