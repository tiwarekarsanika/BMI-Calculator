// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final Function? gesture;

  ReusableCard({required this.colour, this.cardChild, this.gesture});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap : () => gesture!(),
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        // child: Text("Samarth", style: TextStyle(color: Colors.red),),
      ),
    );
  }
}

