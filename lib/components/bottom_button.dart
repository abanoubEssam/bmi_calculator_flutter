import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonBottom extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  ButtonBottom({ required this.onTap , required this.buttonTitle });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeBtnStyle,
          ),
        ),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 25),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
