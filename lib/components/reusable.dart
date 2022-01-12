import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  // const Reusable({Key? key}) : super(key: key);
  Reusable(
      {required this.colour, required this.wildcard, required this.onPress});
  final Color colour;
  final Widget wildcard;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: wildcard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          // color: Color(0XFF1D1E33),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
