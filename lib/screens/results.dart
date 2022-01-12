import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/reusable.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiresult,
      required this.getresult,
      required this.getInterpretation});
  final String bmiresult;
  final String getresult;
  final String getInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result", style: textcolor),
            ),
          ),
          Expanded(
              flex: 5,
              child: Reusable(
                onPress: () {},
                colour: activecolor,
                wildcard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(top: 65.0),
                      child: Text(
                        getresult,
                        style: boldcolor,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      bmiresult,
                      style: result,
                    )),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        getInterpretation,
                        style: labelText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: textcolor,
                ),
              ),
              color: bottomcontainercolor,
              width: double.infinity,
              height: bottomContainerHeight,
              margin: EdgeInsets.only(top: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}
