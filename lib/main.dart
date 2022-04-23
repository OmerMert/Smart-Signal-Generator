import 'package:flutter/material.dart';
import 'package:smart_signal_generator/FlutterBlueApp.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(
          'Signal Controller',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: FlutterBlueApp()
    );
  }
}
