import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GestureDemo(),
    );
  }
}

class GestureDemo extends StatefulWidget {
  GestureDemo() : super();

  final String title = "GestureDetector Demo";

  @override
  GestureDemoState createState() => GestureDemoState();
}

class GestureDemoState extends State<GestureDemo> {
  double newAngle = 0;
  @override
  initState() {
    super.initState();
  }

  Widget scale() {
    return GestureDetector(
      onScaleUpdate: (ScaleUpdateDetails details) {
        setState(() {
          newAngle = details.rotation;
        });
      },
      child: Container(
        child: Transform.rotate(
          angle: (newAngle * 180.0) / pi,
          origin: Offset(50.0, 0.0),
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Stack(
        children: [
          scale(),
        ],
      )),
    );
  }
}
