// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  

  GenderCard({required this.genIcon, required this.genLabel});

  IconData genIcon;
  String genLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Text("data", style: TextStyle(color: Colors.red),),
        Icon(
          genIcon,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          genLabel,
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}