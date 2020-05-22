import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:fluttermenuapp/stack_main_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    home: StackMainMenu(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double x = 1.0092053909775223;
  double y = -0.03659493907278575;
  double z = -0.3;

  double parentY = 0;

  _generateStack() {
    double top = 0;
    double right = 0;

    double height = 70;
    double width = 120;
    int red = 255;

    var myWidgets = new List<Widget>();

    for(int i = 0; i < 5; i++) {
      var widget = Positioned(
        top: top,
        right: right,
//              height: 40.0,
        child: Transform(
          transform: Matrix4(
            1, 0, 0, 0,
            0, 1, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1,
          )..rotateX(x)..rotateY(y)..rotateZ(z),
          alignment: FractionalOffset.center,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(red, 0, 0, 1),
            ),
            height: height,
            width: width,
          ),
        ),
      );

      myWidgets.add(widget);

      top += 8;
      right += 4;

      height += 5;
      width += 5;
      red -= 20;
    }
    return myWidgets;
  }

  int curve = 0;

  @override
  Widget build(BuildContext context) {
    double width = 300.0;
    double height = 350.0;


    double firstChildLeft = 0;
    double secondChildLeft = 70;
    double thirdChildLeft = 120;
    double fourthChildLeft = 170;


    _addCurve() {
      print(curve);
      switch(curve) {
        case 10:return curve += 10;
        case 30:return curve += 40;
        case 50:return 8;
        case 10:return 18;
        default: return curve;
      }
    }

    _detectWall(double leftPosition) {
      double wall = MediaQuery.of(context).size.width / 2.2 - 200;

      curve++;

      if( leftPosition + parentY < wall)
        return leftPosition + parentY;

      return wall - ((leftPosition + parentY) - wall);
    }
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            parentY = details.globalPosition.dy;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[

              Positioned(
                top: 180 + parentY,
                left: _detectWall(fourthChildLeft),
                child: Container(
                  height: 130,
                  width: 200,
                  color: Colors.transparent,
                  child: Stack(
                    children: _generateStack(),
                  ),
                ),
              ),

              Positioned(
                top: 120 + parentY,
                left: _detectWall(thirdChildLeft),
                child: Container(
                  height: 130,
                  width: 200,
                  color: Colors.transparent,
                  child: Stack(
                    children: _generateStack(),
                  ),
                ),
              ),

              Positioned(
                top: 60 + parentY,
                left: _detectWall(secondChildLeft),
                child: Container(
                  height: 130,
                  width: 200,
                  color: Colors.transparent,
                  child: Stack(
                    children: _generateStack(),
                  ),
                ),
              ),


              Positioned(
                top: parentY,
                left: _detectWall(firstChildLeft),
                child: Container(
                  height: 130,
                  width: 200,
                  color: Colors.transparent,
                  child: Stack(
                    children: _generateStack(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }



}
