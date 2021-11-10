// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class Pattern extends StatelessWidget {
  final void Function() buttonPress;

  Pattern(this.buttonPress);

  @override
  Widget build(BuildContext context) {
    final _text = TextEditingController();
    bool _validate = false;
    final ButtonStyle style = ElevatedButton.styleFrom(
      onPrimary: Colors.black,
      fixedSize: const Size(150, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(2, 10, 2, 10),
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
                child: const Text('OFF LEDs'),
                onPressed: buttonPress,
              ),
              Spacer(),
            ]),
      ),
    );
  }
}
