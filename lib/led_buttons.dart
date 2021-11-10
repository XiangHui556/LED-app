// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class LEDButton extends StatelessWidget {
  final void Function(int) buttonPress;
  final void Function(int) longPress;

  LEDButton(this.buttonPress, this.longPress);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      onPrimary: Colors.black,
      fixedSize: const Size(100, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(2, 20, 2, 20),
      child: Center(
        child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //Center Column contents vertically,
            crossAxisAlignment: CrossAxisAlignment
                .center, //Center Column contents horizontally,
            children: <Widget>[
              Spacer(),
              ElevatedButton(
                style: style,
                child: const Text('Red'),
                onPressed: () => buttonPress(0),
                onLongPress: () => longPress(0),
              ),
              Spacer(),
              ElevatedButton(
                style: style,
                child: const Text('Yellow'),
                onPressed: () => buttonPress(1),
                onLongPress: () => longPress(1),
              ),
              Spacer(),
              ElevatedButton(
                style: style,
                child: const Text('Green'),
                onPressed: () => buttonPress(2),
                onLongPress: () => longPress(2),
              ),
              Spacer(),
            ]),
      ),
    );
  }
}
