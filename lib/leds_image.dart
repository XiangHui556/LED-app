// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class LEDImage extends StatelessWidget {
  int redstats = 0;
  int yellowstats = 0;
  int greenstats = 0;

  LEDImage(this.redstats, this.yellowstats, this.greenstats);

  static const red_image = [
    'assets/red-off.png',
    'assets/red-on.png',
    'assets/red-blink.gif',
  ];
  static const yellow_image = [
    'assets/yellow-off.png',
    'assets/yellow-on.png',
    'assets/yellow-blink.gif',
  ];
  static const green_image = [
    'assets/green-off.png',
    'assets/green-on.png',
    'assets/green-blink.gif',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Center(
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, //Center Column contents vertically,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Column contents horizontally,
          children: <Widget>[
            Spacer(),
            Image.asset(red_image[redstats]),
            Spacer(),
            Image.asset(yellow_image[yellowstats]),
            Spacer(),
            Image.asset(green_image[greenstats]),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
