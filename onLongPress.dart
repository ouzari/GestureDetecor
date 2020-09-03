import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,     
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GestureDetector Demo'),
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
  
  var rnd = new Random();
  int randomNumber = 0;

  _showDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("GestureDetector"),
              content: new Text("Hey! I'm onLongPress event"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
  alignment: FractionalOffset.center,
  color: Colors.white,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(randomNumber.toString()),
      ),
      GestureDetector(
        onTap: () {
           
          setState(() {
            randomNumber=rnd.nextInt(100);
          });
        },
        onDoubleTap: () {
          setState(() {
            randomNumber=0;
          });
        },
        onLongPress : () => _showDialog(),
        child: Container(
          color: Colors.blue,
          padding: const EdgeInsets.all(8),
          child: const Text('GET RANDOM NUMBER'),
        ),
      ),
    ],
  ),
)
      ),
      
    );
  }
}
