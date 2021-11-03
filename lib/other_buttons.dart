// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class OtherButton extends StatelessWidget {
  final void Function() buttonPress;
  final void Function() offPress;

  OtherButton(this.buttonPress, this.offPress);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      onPrimary: Colors.black,
      fixedSize: const Size(150, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(2, 50, 2, 30),
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
                child: Text('Random'),
                onPressed: buttonPress,
              ),
              Spacer(),
              ElevatedButton(
                style: style,
                child: Text('OFF LEDs'),
                onPressed: offPress,
              ),
              Spacer(),
            ]),
      ),
    );
  }
}
