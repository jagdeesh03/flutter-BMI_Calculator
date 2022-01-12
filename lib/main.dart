import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(Inputpage());
}

class Inputpage extends StatelessWidget {
  const Inputpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF151026),
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: BMIcalculator(),
    );
  }
}
