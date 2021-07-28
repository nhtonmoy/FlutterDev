import 'package:bmi_calculator/screens/output_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
            primaryColor: kPrimaryColour,
            scaffoldBackgroundColor:  Color(0xFF0A0E28),
      ),
      routes: {
        '/': (context) => InputPage(),
        '/output': (context) => OutputPage(),
      },
      initialRoute: '/',
    );
  }
}
