import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculationResults() {
    _bmi = weight / (pow(height/100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25)
      return "Fatfuck";
    else if (_bmi > 18.5)
      return "Fucking Normie";
    return "Skinny Bitch";
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return "Stop eating to end world hunger";
    else if (_bmi > 18.5)
      return "Normal";
    return "Start eating some food, Motherfucker. Git Gud.";
  }

}

