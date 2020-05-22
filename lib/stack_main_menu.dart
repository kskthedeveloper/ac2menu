import 'package:flutter/material.dart';
import 'dart:math' as math;

class StackMainMenu extends StatefulWidget {
  @override
  _StackMainMenuState createState() => _StackMainMenuState();
}

class _StackMainMenuState extends State<StackMainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Transform(
           alignment: Alignment.center,
           transform: Matrix4.identity()..rotateZ(50)..rotateY(20)..rotateZ(10),
           child: Container(
             width: 100.0,
             height: 50.0,
             color: Colors.red,
           ),
         ),
       ),
    );
  }
}
