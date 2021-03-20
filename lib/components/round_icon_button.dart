import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function? press;
  RoundIconButton({ required this.icon , this.press});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {
        if(press == null){
          return;
        }else{
          press!();
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 6,
      fillColor:  Color(0xFF4C4F5E) ,
      constraints: BoxConstraints.tightFor(
          width: 30,
          height: 30
      ),
    );
  }
}
