import 'package:flutter/material.dart';

class SmallTetxt extends StatelessWidget {
   Color? color;
  double size, height;
  final String text;
  
   SmallTetxt({ Key? key, this.color=  Colors.black54, required this.text, this.height=1.2,  this.size=12  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: FontWeight.w400, fontSize: size, height: height),
    );
  }
}