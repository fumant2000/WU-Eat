import 'package:get/get.dart';

class Dimensions{
  static double ScreenHeight = Get.context!.height;
  static double ScreenWidth = Get.context!.width;

static double pageView= ScreenHeight/2.5;
  static double pageViewContainer= ScreenHeight/3;
  static double pageViewTextContainer= ScreenHeight/6.8;

//dynamic height for padding and margin
  static double height10=ScreenHeight/72.1;
  static double height15=ScreenHeight/43;
  static double height20=ScreenHeight/36.05;
   static double height30=ScreenHeight/23.05;
    static double height40=ScreenHeight/18.06;

//dynamic with for padding and margin
static double width10=ScreenHeight/72.1;
  static double width15=ScreenHeight/43;
  static double width20=ScreenHeight/36.05;
  static double width30=ScreenHeight/22.05;
  static double width40=ScreenHeight/18.06;

//font size
  static double font20= ScreenHeight/36.05;
   static double font17= ScreenHeight/40;
   static double font26= ScreenHeight/30.5;

  //radius
   static double radius15= ScreenHeight/43;
  static double radius20= ScreenHeight/36.05;
  static double radius30= ScreenHeight/23;

  //icon size
   static double iconSize24= ScreenHeight/30.1;
   static double iconSize16= ScreenHeight/35;

   //listview size

   static double listViewImgSize= ScreenWidth/4;
   static double listViewTextSize= ScreenWidth/4;

   //popular food size
   static double popularFoodImgSize = ScreenHeight/1.85;

   //bottom height Bar
   static double bottomHeightBar= ScreenHeight/7;

}