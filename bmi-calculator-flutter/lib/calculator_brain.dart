import 'dart:math';
class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI(){
     _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    return _bmi >= 25 ? 'Overweight' : _bmi <=18.5 ? 'Underweight' : 'Normal';
  }

  String getInterpretation() {
    String overweight = 'Your BMI score is too high. You should eat less and exercise more';
    String underweight = 'Your BMI score is too low. You should eat more';
    String normal = 'Your BMI score is normal. Keep it up!';
    return _bmi >= 25 ? overweight : _bmi <=18.5 ? underweight : normal;
  }
}