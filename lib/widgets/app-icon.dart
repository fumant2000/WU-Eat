import 'package:flutter/material.dart';
import 'package:tmchat/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
final IconData icon;
final Color backgrounColor;
final Color color;
final double size;
final double iconSize;
   AppIcon({ Key? key, required this.icon, 
   this.iconSize=16,
   this.backgrounColor= const Color(0xFFfcf4e4),  this.color=const Color(0xFF756d54), this.size=40 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
width: size,
height: size,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(size/2),
  color: backgrounColor
),
child: Icon(icon, color: color, size: iconSize,),
      
    );
  }
}