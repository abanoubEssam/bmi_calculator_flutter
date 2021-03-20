import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color? color;
  final Widget? cardChild;
  final Function? onPress;
  ReusableCard( {required this.color , this.cardChild ,  this.onPress} );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(onPress == null){
          print("NULL");
          return;
        }else {
          print("pressed");
          onPress!();
        }
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
