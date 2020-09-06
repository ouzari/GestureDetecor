import 'package:flutter/material.dart';

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
  double newScale = 1;
  double oldScale = 1;

  @override
  initState() {
    super.initState();

    newScale = 1;
  }

  Widget scale() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onScaleUpdate: (ScaleUpdateDetails details) {
        setState(() {
          newScale = oldScale * details.scale;
          // oldScale = newScale;
          print(newScale);
        });
      },
      onScaleStart: (ScaleStartDetails details) {
        setState(() {
          oldScale = newScale;
        });
      },
      child: Container(
        child: Transform.scale(
          scale: newScale,
          origin: Offset(0.0, 0.0),
          child: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.green,
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
