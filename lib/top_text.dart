import 'package:flutter/material.dart';

class TestText extends StatelessWidget {
  //final String testString;

  //TestText(this.testString);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      //color: Colors.blue,
      child: Center(
          child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, //Center Column contents vertically,
        crossAxisAlignment:
            CrossAxisAlignment.center, //Center Column contents horizontally,
        children: <Widget>[
          SizedBox(height: 40),
          /*
          Text(
            testString,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          */
        ],
      )),
    );
  }
}
