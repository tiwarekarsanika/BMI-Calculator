
import 'input_page.dart';
import 'dart:math';

class CalBrain{

  final double? height;
  final double? weight;

  CalBrain({this.height, this.weight});
  double? _bmi;

  String? calBMI (double height, double weight){
    _bmi = weight/ pow(height/100, 2);
    return _bmi?.toStringAsFixed(1);
  }

  String? giveResult(){
    if(_bmi! >= 25){
      return "OVERWEIGHT";
    }
    else if(_bmi! > 18.5){
      return "NORMAL";
    }
    else{
      return "UNDERWEIGHT";
    }
  }

  String? describeResult(){
    if(_bmi! >= 25){
      return "You've a higher than normal body weight. Try to exercise more.";
    }
    else if(_bmi! > 18.5){
      return "You've a normal body weight. Good job!";
    }
    else{
      return "You've a lower than normal body weight. Try to eat more";
    }
  }
}