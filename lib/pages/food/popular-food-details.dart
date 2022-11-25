import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchat/utils/colors.dart';
import 'package:tmchat/utils/dimensions.dart';
import 'package:tmchat/widgets/app-column.dart';
import 'package:tmchat/widgets/app-icon.dart';
import 'package:tmchat/widgets/big-text.dart';
import 'package:tmchat/widgets/expandable-text.dart';
import 'package:tmchat/widgets/icon-and-text-widget.dart';
import 'package:tmchat/widgets/small-text.dart';

class PopularFoodsPage extends StatelessWidget {
  const PopularFoodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: Dimensions.popularFoodImgSize*0.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/taro.png'))),
              )),
          Positioned(
            top: Dimensions.height40,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: AppIcon(
                  icon: Icons.arrow_back_ios,
                ),),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                )
              ],
            ),
          ),
          Positioned(
            left:0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize*0.8-25,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right:Dimensions.width20, top: Dimensions.height20 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20)
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: 'Le Taro a la  sauce jaune', ),
                SizedBox(height: Dimensions.height20,),
                  BigText(text: 'Introduce'),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: 'le pouletppowdsbfhdbvhjcbdacvdhcdhvcjihdbvhjjhbdjvfneffiorjennekfkmnreiofverjkfmeirhjiferjnfvkdrnjriefkvnfrkjfvigrk est uen denrre siqjjnkwbdjbedjknediocnemw ncenhfv hcebkdnewklfbhrefvjcnbedkwcmlemcfelwbfcjewfkcned,cf emfbrjkenk'),))
                ],
              )
            )
            ),
      
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height20, bottom:Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
       borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Dimensions.radius20*2),
         topRight: Radius.circular(Dimensions.radius20*2)
       )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Container(
            padding: EdgeInsets.only(top:Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width20, left:Dimensions.width20   ),
            decoration: BoxDecoration(
          color: Colors.white,
       borderRadius: BorderRadius.circular(Dimensions.radius20)
        ),
        child: Row(

          children: [
          Icon(Icons.remove, color: AppColors.signColor,),
          SizedBox(width: Dimensions.width10,),
          BigText(text: '0', color:AppColors.signColor ,),
          SizedBox(width: Dimensions.width10,),
          Icon(Icons.add, color: AppColors.signColor,),
        ],),
          ),
           
           Container(
            padding: EdgeInsets.only(top:Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width10, left:Dimensions.width10  ),
            decoration: BoxDecoration(
          color: AppColors.mainColor,
       borderRadius: BorderRadius.circular(Dimensions.radius20)
        ),
        child:BigText(text:'\$100 | Add to card')
          ),
           
        ],),
      ),
    );
  }
}
