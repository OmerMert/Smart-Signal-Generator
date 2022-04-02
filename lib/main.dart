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
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          backgroundColor: Colors.blue,
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
    return Column(
      children: [
        Text('Signal Type', style: TextStyle(fontSize: 20 ),),
        Buttons(),
        Text('Frequency', style: TextStyle(fontSize: 20 ),),
        MyStatefulWidget(),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
                onPressed: () => {}, child: Image.asset('images/sine.png')),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
                onPressed: () => {}, child: Image.asset('images/triangle.png')),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
                onPressed: () => {}, child: Image.asset('images/sawtooth.png')),
          ),
        ),
      ],
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 100,
      divisions: 5,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}