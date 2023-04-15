// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_card.dart';
import 'reusable_card.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

CalBrain calB = new CalBrain();

const bottomBarHeight = 65.0;
const newCardColor = Color(0xFF111328);
const activeCard = Color(0xFF1D1E33);

enum Gender {
  male,
  female,
}

double height = 180;
double weight = 60;
int age = 25;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender? selectedGender;

  // String? bmi;
  // String? bmiRes;
  // String? descBMI;

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
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    gesture: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCard
                        : newCardColor,
                    cardChild: GenderCard(
                        genIcon: FontAwesomeIcons.mars, genLabel: "MALE"),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    gesture: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCard
                        : newCardColor,
                    cardChild: GenderCard(
                        genIcon: FontAwesomeIcons.venus, genLabel: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: newCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
                      activeTrackColor: Color(0xFFFFFFFF),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height,
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.roundToDouble();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: newCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                        weight.toString(),
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),
                      ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundButton(
                              icon:FontAwesomeIcons.minus,
                              buttFunc: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundButton(
                              icon:FontAwesomeIcons.plus,
                              buttFunc: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ]
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: newCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                        age.toString(),
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),
                      ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              buttFunc: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              buttFunc: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ]
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){

              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: calB.calBMI(height, weight),
                    bmiRes: calB.giveResult(),
                    descBMI: calB.describeResult(),
                  ),
                ),
              );
            },
            child: Container(
              color: Color(0xFFeb1555),
              width: double.infinity,
              height: bottomBarHeight,
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "CALCULATE",
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

class RoundButton extends StatelessWidget {
  final IconData? icon;
  final Function? buttFunc;

  RoundButton({this.icon, this.buttFunc});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => buttFunc!(),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 50,
        width: 50,
      ),
      child: Icon(icon),
    );
  }
}
