import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchat/controllers/cart-controller.dart';
import 'package:tmchat/controllers/popular-product-controller.dart';
import 'package:tmchat/pages/home/main-foods-page.dart';
import 'package:tmchat/utils/app-constants.dart';
import 'package:tmchat/utils/colors.dart';
import 'package:tmchat/utils/dimensions.dart';
import 'package:tmchat/widgets/app-icon.dart';
import 'package:tmchat/widgets/big-text.dart';
import 'package:tmchat/widgets/small-text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: Dimensions.height20 * 2.4,
            right: Dimensions.width20,
            left: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      backgrounColor: AppColors.mainColor,
                      color: Colors.white,
                      iconSize: Dimensions.iconSize24,
                    )),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => MainFoodsPage());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    backgrounColor: AppColors.mainColor,
                    color: Colors.white,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  backgrounColor: AppColors.mainColor,
                  color: Colors.white,
                  iconSize: Dimensions.iconSize24,
                )
              ],
            )),
        Positioned(
            top: Dimensions.height20 * 5.5,
            right: Dimensions.width20,
            left: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              //color: Colors.red,
               child: MediaQuery.removePadding(
    context: context, 
    removeTop: true, 
  child:
  
          GetBuilder<CartController>(builder:(cartController){
    return ListView.builder(
      itemCount: cartController.getItems.length,
      itemBuilder: (_, index){
        return Container(
          height: Dimensions.height20*5, 
          width: double.maxFinite, 
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                height: Dimensions.height20*5,
                width: Dimensions.height20*5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!) )
                ),
              ),
              SizedBox(width: Dimensions.width10,),
              Expanded(
                child: Container(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      BigText(text: cartController.getItems[index].name!, color: Colors.black54,),
                      SmallTetxt(text: 'Spicy'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        BigText(text: cartController.getItems[index].price!.toString(), color: Colors.black54,),
                          Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height10,
                        bottom: Dimensions.height10,
                        right: Dimensions.width10,
                        left: Dimensions.width10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                           // populaProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                            size: Dimensions.font17,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        BigText(
                          text:'0',
                          // populaProduct.inCartItems.toString(),
                          color: AppColors.signColor,
                          size: Dimensions.font17,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        GestureDetector(
                          onTap: () {
                           // populaProduct.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                            size: Dimensions.font17,
                          ),
                        )
                      ],
                    ),
                  ),
                 
                      ],)
              ],)))
              ],
          ),
          );
      }
      );
    
  } ,)
  )
            ))
      ]),
    );
  }
}
