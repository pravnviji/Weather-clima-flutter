import 'package:flutter/material.dart';

const isDev = true;

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

final ButtonStyle kButtonTextStyle = TextButton.styleFrom(
  primary: Colors.white,
  minimumSize: Size(88, 36),
  textStyle: TextStyle(
    fontSize: 20.0,
    fontFamily: 'Spartan MB',
    color: Colors.white,
  ),
  padding: EdgeInsets.all(16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    side: BorderSide(width: 3, color: Colors.white),
  ),
);

final TextStyle kTextFieldStyle = TextStyle(
  color: Colors.white,
  fontSize: 15.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
