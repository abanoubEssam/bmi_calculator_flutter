import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';



class IconWidget extends StatelessWidget {

  final String label;
  final IconData icon;

  IconWidget(this.label , this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(label,
          style: labelTextStyle,
        )
      ],
    );
  }
}