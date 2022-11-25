
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchat/controllers/recommended-product-controller.dart';
import 'package:tmchat/routes/routes-helper.dart';
import 'package:tmchat/utils/app-constants.dart';
import 'package:tmchat/utils/colors.dart';
import 'package:tmchat/utils/dimensions.dart';
import 'package:tmchat/widgets/app-icon.dart';
import 'package:tmchat/widgets/big-text.dart';
import 'package:tmchat/widgets/expandable-text.dart';

class RecommendedFoodsPage extends StatelessWidget {
  int pageId;
 RecommendedFoodsPage({ Key? key , required this.pageId }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product= Get.find<RecommendedProductController>().recommendedProductList[pageId];
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
                    Get.toNamed(RouteHelper.initial);
                  },
                  child: AppIcon(
                  icon: Icons.clear,
                ),),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                )
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
bottomNavigationBar: Column(
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
        AppIcon(
          iconSize: Dimensions.iconSize24,
        color: Colors.white,
        backgrounColor: AppColors.mainColor,
          icon: Icons.remove),
          BigText(text: '\$ ${product.price!} ' + ' x ' + ' 0 ', color: AppColors.mainBlackColor, size: Dimensions.font17,),
         AppIcon(
          iconSize: Dimensions.iconSize24,
        color: Colors.white,
        backgrounColor: AppColors.mainColor,
          icon: Icons.add
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
           
           Container(
            padding: EdgeInsets.only(top:Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.width10, left:Dimensions.width10   ),
            decoration: BoxDecoration(
          color: AppColors.mainColor,
       borderRadius: BorderRadius.circular(Dimensions.radius20)
        ),
        child:BigText(text:'\$100 | Add to card', size: Dimensions.font17,)
          ),
           
        ],),
      ),
  ],
),

    );
  }
}