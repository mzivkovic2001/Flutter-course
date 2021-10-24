import 'package:flutter/material.dart';

const TextStyle kLabelTextStyle = TextStyle(
    fontSize: 18.0,
    color: Color(0xFF8D8E98)
);

const TextStyle kNumberTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.w900,
);

const TextStyle kLargeButtonTextStyle = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold
);

const TextStyle kTitleTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold
);

const TextStyle kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold
);

const TextStyle kBMITextStyle = TextStyle(
    fontSize: 100.0,
    fontWeight: FontWeight.bold,
);

const TextStyle kBodyTextStyle = TextStyle(
    fontSize: 22.0,
);

const SliderThemeData kSliderCustomTheme = SliderThemeData(
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
    overlayColor: Color(0x29EB1555),
    thumbColor: kBottomContainerBackgroundColor,
    activeTrackColor: Colors.white,
    inactiveTrackColor: Color(0xFF8D8E98),
);

const double kBottomContainerHeight = 60.0;
const Color kBottomContainerBackgroundColor = Color(0xFFEB1555);
const Color kInactiveCardBackgroundColor = Color(0xFF111328);
const Color kActiveCardBackgroundColor = Color(0XFF1D1E33);