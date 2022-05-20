import 'package:flutter/material.dart';

class ControlPage extends StatelessWidget {
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
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blueGrey[200]),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Signal Type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

    int signaltype = 0;

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black)),
              child: TextButton(
                  onPressed: () => {signaltype = 0}, 
                  child: Image.asset('images/sine.png')),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black)),
              child: TextButton(
                  onPressed: () => {signaltype = 1},
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
                  border: Border.all(color: Colors.black)),
              child: TextButton(
                  onPressed: () => {signaltype = 2},
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
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blueGrey[200]),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Amplitude',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          AmplitudeSlider(),
        ],
      ),
    );
  }
}

class AmplitudeSlider extends StatefulWidget {
  const AmplitudeSlider({Key? key}) : super(key: key);

  @override
  State<AmplitudeSlider> createState() => _AmplitudeSliderState();
}

class _AmplitudeSliderState extends State<AmplitudeSlider> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 20,
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
      Container(
        margin: EdgeInsets.all(20.0),
        child: Text(
          '${_currentSliderValue.round()} V',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}

class Frequency extends StatelessWidget {
  const Frequency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blueGrey[200]),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Frequency',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          FrequencySlider(),
        ],
      ),
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
    return Column(children: [
      Slider(
        value: _currentSliderValue,
        max: 100,
        divisions: 20,
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
      Container(
        margin: EdgeInsets.all(20.0),
        child: Text(
          '${_currentSliderValue.round()} Hz',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
