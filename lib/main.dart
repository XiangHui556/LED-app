import 'package:flutter/material.dart';

import './top_text.dart';
import './led_buttons.dart';
import './leds_image.dart';
import './other_buttons.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _testIndex = 0;
  var _redimage = 0;
  var _yellowimage = 0;
  var _greenimage = 0;

  void _pressFunction(int color) {
    setState(() {
      switch (color) {
        case 0:
          if (_redimage != 0) {
            _redimage = 0;
          } else {
            _redimage = 1;
          }
          break;
        case 1:
          if (_yellowimage != 0) {
            _yellowimage = 0;
          } else {
            _yellowimage = 1;
          }
          break;
        case 2:
          if (_greenimage != 0) {
            _greenimage = 0;
          } else {
            _greenimage = 1;
          }
          break;
      }
    });
  }

  void _longPressFunction(int color) {
    setState(() {
      switch (color) {
        case 0:
          if (_redimage == 1) {
            _redimage = 2;
          } else if (_redimage != 0) {
            _redimage = 0;
          } else {
            _redimage = 2;
          }
          break;
        case 1:
          if (_yellowimage == 1) {
            _yellowimage = 2;
          } else if (_yellowimage != 0) {
            _yellowimage = 0;
          } else {
            _yellowimage = 2;
          }
          break;
        case 2:
          if (_greenimage == 1) {
            _greenimage = 2;
          } else if (_greenimage != 0) {
            _greenimage = 0;
          } else {
            _greenimage = 2;
          }
          break;
      }
    });
  }

  void _rndFunction() {
    setState(() {
      Random rnd;
      rnd = new Random();
      _redimage = rnd.nextInt(3);
      rnd = new Random();
      _yellowimage = rnd.nextInt(3);
      rnd = new Random();
      _greenimage = rnd.nextInt(3);
    });
  }

  void _offFunction() {
    setState(() {
      _redimage = 0;
      _yellowimage = 0;
      _greenimage = 0;
    });
  }

  late Image myImage1;
  late Image myImage2;
  late Image myImage3;
  late Image myImage4;
  late Image myImage5;
  late Image myImage6;
  @override
  void initState() {
    super.initState();
    myImage1 = Image.asset('assets/red-blink.gif');
    myImage2 = Image.asset('assets/yellow-blink.gif');
    myImage3 = Image.asset('assets/green-blink.gif');
    myImage4 = Image.asset('assets/red-on.png');
    myImage5 = Image.asset('assets/yellow-on.png');
    myImage6 = Image.asset('assets/green-on.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImage1.image, context);
    precacheImage(myImage2.image, context);
    precacheImage(myImage3.image, context);
    precacheImage(myImage4.image, context);
    precacheImage(myImage5.image, context);
    precacheImage(myImage6.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('LED Control'),
        ),
        body: Column(
          children: <Widget>[
            TestText(),
            LEDImage(_redimage, _yellowimage, _greenimage),
            LEDButton(_pressFunction, _longPressFunction),
            OtherButton(_rndFunction, _offFunction),
          ],
        ),
      ),
    );
  }
}
