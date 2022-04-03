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
        backgroundColor: Colors.blueGrey[400],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Signal Controller',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(child: SignalType()),
                Expanded(child: Amplitude()),
                Expanded(child: Frequency()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignalType extends StatelessWidget {
  const SignalType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Signal Type',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Buttons(),
        ],
      ),
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
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.black)),
              child: TextButton(
                  onPressed: () => {}, child: Image.asset('images/sine.png')),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.black)),
              child: TextButton(
                  onPressed: () => {},
                  child: Image.asset('images/triangle.png')),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.black)),
              child: TextButton(
                  onPressed: () => {},
                  child: Image.asset('images/sawtooth.png')),
            ),
          ),
        ),
      ],
    );
  }
}

class Amplitude extends StatelessWidget {
  const Amplitude({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      width: 500,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Amplitude',
              style: TextStyle(fontSize: 20),
            ),
          ),
          FrequencySlider(),
        ],
      ),
    );
  }
}

class Frequency extends StatelessWidget {
  const Frequency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(20.0),
          child: Text(
            'Frequency',
            style: TextStyle(fontSize: 20),
          ),
        ),
        FrequencySlider(),
      ]),
    );
  }
}

class FrequencySlider extends StatefulWidget {
  const FrequencySlider({Key? key}) : super(key: key);

  @override
  State<FrequencySlider> createState() => _FrequencySliderState();
}

class _FrequencySliderState extends State<FrequencySlider> {
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
