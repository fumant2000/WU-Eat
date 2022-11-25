import 'package:flutter/material.dart';
import 'package:tmchat/utils/colors.dart';
import 'package:tmchat/utils/dimensions.dart';
import 'package:tmchat/widgets/small-text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({ Key? key, required this.text }) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool heiddenText=true;
  double textHeight= Dimensions.ScreenHeight/5.36;

   @override
   void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf=widget.text.substring(0, textHeight.toInt());
      secondHalf= widget.text.substring(textHeight.toInt()+1, widget.text.length);
      
    }else{
      firstHalf= widget.text;
      secondHalf='';
    }
   }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallTetxt(text: firstHalf, size: Dimensions.font17,):Column(
        children: [
          SmallTetxt(text:heiddenText?(firstHalf+'.....'):(firstHalf+secondHalf),size: Dimensions.font17, height: 1.8, color: AppColors.textColor, ),
          InkWell(
            onTap: (){
              setState(() {
                heiddenText= !heiddenText;
              });
            },
            child: Row(children: [
              SmallTetxt(text: 'Show more', color: AppColors.mainColor,size: Dimensions.font17,),
              Icon(Icons.arrow_drop_down, color: AppColors.mainColor,)
            ],),
          )
        ],
      ),
    );
  }
}