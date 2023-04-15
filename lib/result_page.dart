import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

InputPage inp = const InputPage();

class ResultPage extends StatelessWidget {
  String? bmi;
  String? bmiRes;
  String? descBMI;

  ResultPage({required this.bmi, required this.bmiRes, required this.descBMI});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(32, 17, 68, 1),
        title: Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, left: 20),
            child: Text(
              "Your Result",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Color(0xFF111328),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(bmiRes!,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                      )),
                  Text(bmi!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 90.0,
                        fontWeight: FontWeight.w800,
                      )),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Text(
                      descBMI!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputPage(),
                ),
              );
            },
            child: Container(
              color: Color(0xFFeb1555),
              width: double.infinity,
              height: 65.0,
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "RCALCULATE",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
