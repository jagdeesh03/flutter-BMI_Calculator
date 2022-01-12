import 'dart:math';

class CalculatorFunction {
  CalculatorFunction({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0;
  String bmicalculator() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL WEIGHT';
    } else {
      return 'LIGHT WEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Your body higher than normal body so do exercise regularly';
    } else if (_bmi > 18.5) {
      return 'your condition is normal.good job!';
    } else {
      return 'Your body is lesser than normal body.eat more';
    }
  }
}
