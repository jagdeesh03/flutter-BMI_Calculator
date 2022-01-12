import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';

class Iconwidget extends StatelessWidget {
  Iconwidget({
    required this.icon,
    required this.gender,
  });
  final String gender;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: labelText,
        ),
      ],
    );
  }
}
