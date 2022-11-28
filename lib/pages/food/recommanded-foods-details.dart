
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchat/controllers/cart-controller.dart';
import 'package:tmchat/controllers/popular-product-controller.dart';
import 'package:tmchat/controllers/recommended-product-controller.dart';
import 'package:tmchat/pages/cart/cart-page.dart';
import 'package:tmchat/routes/routes-helper.dart';
import 'package:tmchat/utils/app-constants.dart';
import 'package:tmchat/utils/colors.dart';
import 'package:tmchat/utils/dimensions.dart';
import 'package:tmchat/widgets/app-icon.dart';
import 'package:tmchat/widgets/big-text.dart';
import 'package:tmchat/widgets/expandable-text.dart';

class RecommendedFoodsPage extends StatelessWidget {
  int pageId;
  String page;
 RecommendedFoodsPage({ Key? key , required this.pageId, required this.page }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product= Get.find<RecommendedProductController>().recommendedProductList[pageId];
     Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
body: CustomScrollView(
  slivers: [
    SliverAppBar(
      automaticallyImplyLeading : false,
      toolbarHeight: 70,
      title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               GestureDetector(
                  onTap: (){
                    if(page=='cartpage'){
                        Get.toNamed(RouteHelper.getCartPage());
                      }else{
                        Get.toNamed(RouteHelper.getInitial());
                      }
                  },
                  child: AppIcon(
                  icon: Icons.clear,
                ),),
                 GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                       onTap: () {
                        if(controller.totalItems>=1)
                              Get.toNamed(RouteHelper.getCartPage());
                            },
                      child: Stack(children: [
                        AppIcon(
                          icon: Icons.shopping_cart_outlined,
                        ),
                        Get.find<PopularProductController>().totalItems>=1? Positioned(
                          right: 0,top: 0,
                         
                            child: AppIcon(
                              icon: Icons.circle, size: 20,
                              color: Colors.transparent, backgrounColor: AppColors.mainColor,
                           
                          )
                        ):Container(),
                        Get.find<PopularProductController>().totalItems>=1? Positioned(
                          right: 4,top: 4,
                          child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                          color: Colors.white, size: 12,
                          )
                        ):Container(),
                      ])                                    
                    );
                  }), 
                
              ],
            ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20)
            )
          ),
          padding: EdgeInsets.only(top:5, bottom: 10),
        
          width: double.maxFinite,
          child: Center(child: BigText(text: product.name!, size: Dimensions.font26, color: AppColors.titleColor,),)
        )
        ,),
      //pinned: true,
      backgroundColor: AppColors.yellowColor,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
          //'assets/images/ndole.jpg',
        width: double.maxFinite,
        fit: BoxFit.cover,
        ) ,
        
        ),
    ),
    SliverToBoxAdapter(
     child: Column(children: [
      Container(
        margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
        child: ExpandableTextWidget(text: product.description!,),
      )
     ],),
    )
  ],
),
bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller) {
  return  Column(
  mainAxisSize: MainAxisSize.min,
  children: [
   Container(
    margin: EdgeInsets.only(
      left: Dimensions.width20*2.5,
      right: Dimensions.width20*2.5,
      top: Dimensions.height10,bottom: Dimensions.height10
    ),
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      GestureDetector(
        onTap: (){
            controller.setQuantity(false);
          },
        child: AppIcon(
          iconSize: Dimensions.iconSize24,
        color: Colors.white,
        backgrounColor: AppColors.mainColor,
          icon: Icons.remove),
      ),
          BigText(text: '\$ ${product.price!} ' + ' x ' + '${controller.inCartItems}', color: AppColors.mainBlackColor, size: Dimensions.font17,),
        GestureDetector(
          onTap: (){
            controller.setQuantity(true);
          },
          child: AppIcon(
           iconSize: Dimensions.iconSize24,
                color: Colors.white,
                backgrounColor: AppColors.mainColor,
           icon: Icons.add
           ),
        ),
      ],
    )
  ,), 
   
   Container(
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
        child:Icon(
          Icons.favorite,
          color: AppColors.mainColor,
          )
          ),
           
          GestureDetector(
            onTap: (){
              controller.addItems(product);
            },
            child: Container(
             padding: EdgeInsets.only(top:Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width10, left:Dimensions.width10   ),
             decoration: BoxDecoration(
                    color: AppColors.mainColor,
                 borderRadius: BorderRadius.circular(Dimensions.radius20)
                  ),
                  child:BigText(text:'\$ ${product.price!} | Add to card', size: Dimensions.font17,)
                    ),
          ),
           
        ],),
      ),
  ],
);


  
},)
    );
  }
}