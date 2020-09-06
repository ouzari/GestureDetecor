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
  Offset dxy = Offset(0, 0);
  @override
  initState() {
    super.initState();
  }

  Widget drag() {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          dxy = dxy + details.delta;
        });
        print(dxy);
      },
      child: Container(
        child: Transform.translate(
          offset: dxy,
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.deepPurple,
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
          drag(),
        ],
      )),
    );
  }
}
