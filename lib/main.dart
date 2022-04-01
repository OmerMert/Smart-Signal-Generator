import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Text(
            'Signal Controller',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        body: SignalChoose(),
      ),
    );
  }
}

class SignalChoose extends StatelessWidget {
  const SignalChoose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(),
    );
  }
}
