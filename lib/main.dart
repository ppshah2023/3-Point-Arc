import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      App(),
    );

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: ShapesPainter(10, 20),
          child: Container(
            height: 700,
          ),
        ),
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  final double length;
  final double change;

  ShapesPainter(this.length, this.change);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    paint.color = Colors.black;

    Path doubler = Path();
    doubler.arcTo(
      Rect.fromLTWH(
        (size.width / 2) - (length / 2),
        (size.height / 2) - (change / 2),
        length,
        length,
      ),
      0,
      -pi,
      true,
    );
    doubler.arcTo(
      Rect.fromPoints(
        Offset(
          (size.width / 2) + (length / 2),
          (size.height / 2) + (change / 2),
        ),
        Offset(
          (size.width / 2) - (length / 2),
          (size.height / 2) + (change / 2) + length,
        ),
      ),
      0,
      pi,
      false,
    );
    doubler.close();
    canvas.drawPath(doubler, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
