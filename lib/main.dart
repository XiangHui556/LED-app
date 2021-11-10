import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import './top_text.dart';
import './led_buttons.dart';
import './leds_image.dart';
import './other_buttons.dart';
import './freq_tab.dart';
import './pattern.dart';
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pi LED Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: FlutterBluetoothSerial.instance.requestEnable(),
        builder: (context, future) {
          if (future.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                height: double.infinity,
                child: Center(
                  child: Icon(
                    Icons.bluetooth_disabled,
                    size: 200.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            );
          } else if (future.connectionState == ConnectionState.done) {
            return Home();
          } else {
            return Home();
          }
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  BluetoothConnection? connection;
  static int _redimage = 0;
  static int _yellowimage = 0;
  static int _greenimage = 0;

  static double _redfreq = 2;
  static double _yellowfreq = 2;
  static double _greenfreq = 2;
  BluetoothDevice? server;
  String? _device_name = "No Device";
  var _device_address;

  void _freq_tab(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return FreqTab(_setFreqFunction);
      }),
    );
  }

  void _device_update(BluetoothDevice? device) {
    setState(() {
      _device_name = device!.name;
      _device_address = device.address;
      server = device;
      //connectToBluetooth();
      BluetoothConnection.toAddress(_device_address).then((_connection) {
        print('Connected to the device');
        connection = _connection;
      });
    });
  }

  void _sendData() async {
    try {
      String text = "1," +
          _redimage.toString() +
          "," +
          _yellowimage.toString() +
          "," +
          _greenimage.toString();
      connection!.output.add(ascii.encode(text + "\r\n"));
      await connection!.output.allSent;
    } catch (e) {}
  }

  void _sendPattern() async {
    try {
      String text = "3";
      connection!.output.add(ascii.encode(text + "\r\n"));
      await connection!.output.allSent;
    } catch (e) {}
  }

  void _sendDataFreq() async {
    try {
      String text2 = "2," +
          _redfreq.toStringAsFixed(3) +
          "," +
          _yellowfreq.toStringAsFixed(3) +
          "," +
          _greenfreq.toStringAsFixed(3);
      connection!.output.add(ascii.encode(text2 + "\r\n"));
      await connection!.output.allSent;
    } catch (e) {}
  }

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
    _sendData();
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
    _sendData();
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
    _sendData();
  }

  void _offFunction() {
    setState(() {
      _redimage = 0;
      _yellowimage = 0;
      _greenimage = 0;
    });
    _sendData();
  }

  void _setFreqFunction(double red, double yellow, double green) {
    setState(() {
      _redfreq = red;
      _yellowfreq = yellow;
      _greenfreq = green;
    });
    _sendDataFreq();
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
    Future.doWhile(() async {
      // Wait if adapter not enabled
      if ((await FlutterBluetoothSerial.instance.isEnabled) ?? false) {
        return false;
      }
      await Future.delayed(Duration(milliseconds: 0xDD));
      return true;
    }).then((_) {
      // Update the address field
      FlutterBluetoothSerial.instance.address.then((address) {
        setState(() {});
      });
    });
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
      title: 'Pi LED Controller',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('LED Control (${_device_name})'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TestText(_freq_tab, _device_update),
              LEDImage(_redimage, _yellowimage, _greenimage),
              LEDButton(_pressFunction, _longPressFunction),
              OtherButton(_rndFunction, _sendPattern),
              Pattern(_offFunction),
            ],
          ),
        ),
      ),
    );
  }
}
