import 'package:bmi_calculator/calculator_function.dart';
import 'package:bmi_calculator/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_widget.dart';
import '../components/reusable.dart';
import '../constant.dart';

enum Gender {
  male,
  female,
}

class BMIcalculator extends StatefulWidget {
  const BMIcalculator({Key? key}) : super(key: key);

  @override
  _BMIcalculatorState createState() => _BMIcalculatorState();
}

class _BMIcalculatorState extends State<BMIcalculator> {
  Gender? selectinggender;
  int height = 180;
  int weight = 50;
  int age = 10;
  void updateweight(int value) {
    if (value == 1) {
      weight = weight - 1;
    } else {
      weight = weight + 1;
    }
  }

  void updateage(int values) {
    if (values == 1) {
      age = age - 1;
    } else {
      age = age + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable(
                    onPress: () {
                      setState(() {
                        selectinggender = Gender.male;
                      });
                    },
                    wildcard:
                        Iconwidget(icon: FontAwesomeIcons.mars, gender: "MALE"),
                    colour: selectinggender == Gender.male
                        ? activecolor
                        : inactivecolor,
                  ),
                ),
                Expanded(
                  child: Reusable(
                    onPress: () {
                      setState(() {
                        selectinggender = Gender.female;
                      });
                    },
                    wildcard: Iconwidget(
                        icon: FontAwesomeIcons.venus, gender: "FEMALE"),
                    colour: selectinggender == Gender.female
                        ? activecolor
                        : inactivecolor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable(
                onPress: () {},
                colour: activecolor,
                wildcard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT", style: labelText),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: textweight),
                        Text("CM", style: labelText),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0XFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Reusable(
                  onPress: () {},
                  wildcard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: labelText,
                      ),
                      Text(
                        weight.toString(),
                        style: textweight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                            onPressed: () {
                              setState(() {
                                updateweight(1);
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundedButton(
                            onPressed: () {
                              setState(() {
                                updateweight(2);
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: activecolor,
                )),
                Expanded(
                  child: Reusable(
                    onPress: () {},
                    wildcard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: labelText),
                        Text(age.toString(), style: textweight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                                icon: FontAwesomeIcons.minus,
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    updateage(1);
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundedButton(
                                icon: FontAwesomeIcons.plus,
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    updateage(2);
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    colour: activecolor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorFunction calc =
                  CalculatorFunction(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ResultPage(
                      bmiresult: calc.bmicalculator(),
                      getresult: calc.getResult(),
                      getInterpretation: calc.getInterpretation());
                },
              ));
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE",
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

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.icon, required this.color, required this.onPressed});
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
