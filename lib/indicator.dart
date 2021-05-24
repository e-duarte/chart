import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final color;
  final text;

  Indicator({this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Text(text),
      ],
    );
  }
}
