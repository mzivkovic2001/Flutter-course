import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: Color(0xFF0A0E21),
          ),
          textTheme: TextTheme(
            //bodyText1: TextStyle(color: Color(0xFFFFFFFF)),
            bodyText2: TextStyle(color: Color(0xFFFFFFFF)),
          ),
        ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultsPage(),
      },
    );
  }
}
