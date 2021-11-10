import 'package:flutter/material.dart';

class FreqTab extends StatefulWidget {
  final void Function(double, double, double) sendFreq1;
  FreqTab(this.sendFreq1);

  @override
  State<FreqTab> createState() => _FreqTabState(this.sendFreq1);
}

class _FreqTabState extends State<FreqTab> {
  static double _redSliderValue = 2;
  static double _yellowSliderValue = 2;
  static double _greenSliderValue = 2;
  static const double smin = 0.2;
  static const double smax = 10;
  static const sdivison = 100;
  final void Function(double, double, double) sendFreq;

  _FreqTabState(this.sendFreq);

  void _resetFunction() {
    setState(() {
      _redSliderValue = 2.0;
      _yellowSliderValue = 2.0;
      _greenSliderValue = 2.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      onPrimary: Colors.black,
      fixedSize: const Size(150, 75),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    );
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Frequency Control"),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, //Center Column contents vertically,
        crossAxisAlignment:
            CrossAxisAlignment.center, //Center Column contents horizontally,
        children: <Widget>[
          Spacer(),
          Text(
            "Red LED ${double.parse(_redSliderValue.toStringAsFixed(1))}\Hz (${double.parse((1 / _redSliderValue).toStringAsFixed(2))}s)",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Slider(
              value: _redSliderValue,
              min: smin,
              max: smax,
              divisions: sdivison,
              thumbColor: Colors.red[900],
              activeColor: Colors.redAccent,
              label:
                  double.parse(_redSliderValue.toStringAsFixed(2)).toString(),
              onChanged: (double value) {
                setState(() {
                  _redSliderValue = value;
                });
              }),
          Spacer(),
          Text(
            "Yellow LED ${double.parse(_yellowSliderValue.toStringAsFixed(1))}\Hz (${double.parse((1 / _yellowSliderValue).toStringAsFixed(2))}s)",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Slider(
              value: _yellowSliderValue,
              min: smin,
              max: smax,
              divisions: sdivison,
              thumbColor: Colors.yellow[800],
              activeColor: Colors.yellowAccent,
              label: double.parse(_yellowSliderValue.toStringAsFixed(2))
                  .toString(),
              onChanged: (double value) {
                setState(() {
                  _yellowSliderValue = value;
                });
              }),
          Spacer(),
          Text(
            "Green LED ${double.parse(_greenSliderValue.toStringAsFixed(1))}\Hz (${double.parse((1 / _greenSliderValue).toStringAsFixed(2))}s)",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Slider(
              value: _greenSliderValue,
              min: smin,
              max: smax,
              divisions: sdivison,
              thumbColor: Colors.green[800],
              activeColor: Colors.lightGreenAccent,
              label:
                  double.parse(_greenSliderValue.toStringAsFixed(2)).toString(),
              onChanged: (double value) {
                setState(() {
                  _greenSliderValue = value;
                });
              }),
          Spacer(),
          Container(
            child: Center(
                child: Row(
              children: [
                Spacer(),
                ElevatedButton(
                  style: style,
                  child: Text('Reset',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  onPressed: null,
                  onLongPress: _resetFunction,
                ),
                Spacer(),
                ElevatedButton(
                  style: style,
                  child: Text('Send',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  onPressed: () => sendFreq(
                      _redSliderValue, _yellowSliderValue, _greenSliderValue),
                ),
                Spacer(),
              ],
            )),
          ),
          Spacer(),
          Spacer(),
          Spacer(),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
