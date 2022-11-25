import 'package:flutter/material.dart';
import 'package:tmchat/utils/dimensions.dart';
import 'package:tmchat/widgets/small-text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  //final Color color;
  final Color iconColor;
   IconAndTextWidget({ Key? key, required this.icon, required this.text,  required this.iconColor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize16,),SizedBox(width: 5,),
        SmallTetxt(text: text),
      ],
      
    );
  }
}