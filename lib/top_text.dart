import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:async';

import './blue_connect.dart';

class TestText extends StatelessWidget {
  final void Function(BuildContext context) buttonPress;
  final void Function(BluetoothDevice? device) getname;

  TestText(this.buttonPress, this.getname);
  //final String testString;

  //TestText(this.testString);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      onPrimary: Colors.black,
      fixedSize: const Size(150, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(15, 20, 15, 5),
      //color: Colors.blue,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: style,
              child: const Text('Bluetooth'),
              onPressed: () async {
                final BluetoothDevice? selectedDevice =
                    await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectBondedDevicePage(checkAvailability: true);
                    },
                  ),
                );

                if (selectedDevice != null) {
                  print('Connect -> selected ' + selectedDevice.address);
                  getname(selectedDevice);
                } else {
                  print('Connect -> no device selected');
                }
              },
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            ElevatedButton(
                style: style,
                child: const Text('Frequency'),
                onPressed: () => buttonPress(context)),
            /*
          Text(
            testString,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          */
          ],
        ),
      ),
    );
  }
}
