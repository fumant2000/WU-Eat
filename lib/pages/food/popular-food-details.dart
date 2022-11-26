import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchat/controllers/cart-controller.dart';
import 'package:tmchat/controllers/popular-product-controller.dart';
import 'package:tmchat/pages/cart/cart-page.dart';
import 'package:tmchat/pages/home/main-foods-page.dart';
import 'package:tmchat/utils/app-constants.dart';
import 'package:tmchat/utils/colors.dart';
import 'package:tmchat/utils/dimensions.dart';
import 'package:tmchat/widgets/app-column.dart';
import 'package:tmchat/widgets/app-icon.dart';
import 'package:tmchat/widgets/big-text.dart';
import 'package:tmchat/widgets/expandable-text.dart';
import 'package:tmchat/widgets/icon-and-text-widget.dart';
import 'package:tmchat/widgets/small-text.dart';

class PopularFoodsPage extends StatelessWidget {
  int pageId;
  PopularFoodsPage({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    print('page is ' + pageId.toString());
    print('product name is ' + product.name.toString());
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  height: Dimensions.popularFoodImgSize * 0.8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(AppConstants.BASE_URL +
                              AppConstants.UPLOAD_URL +
                              product.img!)
                          //AssetImage('assets/images/taro.png')
                          )),
                )),
            Positioned(
              top: Dimensions.height40,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MainFoodsPage());
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(children: [
                      AppIcon(
                        icon: Icons.shopping_cart_outlined,
                      ),
                      Get.find<PopularProductController>().totalItems>=1? Positioned(
                        right: 0,top: 0,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(()=>CartPage());
                          },
                          child: AppIcon(
                            icon: Icons.circle, size: 20,
                            color: Colors.transparent, backgrounColor: AppColors.mainColor,
                          )
                        )
                      ):Container(),
                      Get.find<PopularProductController>().totalItems>=1? Positioned(
                        right: 4,top: 4,
                        child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                        color: Colors.white, size: 12,
                        )
                      ):Container(),
                    ]);
                  }), 
                
                ],
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodImgSize * 0.8 - 25,
                child: Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.height20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20)),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppColumn(
                          text: product.name!,
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        BigText(text: 'Introduce'),
                        Expanded(
                            child: SingleChildScrollView(
                          child:
                              ExpandableTextWidget(text: product.description!),
                        ))
                      ],
                    ))),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (populaProduct) {
            return Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        right: Dimensions.width20,
                        left: Dimensions.width20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            populaProduct.setQuantity(false);
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
                          text: populaProduct.inCartItems.toString(),
                          color: AppColors.signColor,
                          size: Dimensions.font17,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        GestureDetector(
                          onTap: () {
                            populaProduct.setQuantity(true);
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
                 
                  GestureDetector(
                          onTap: () {
                            populaProduct.addItems(product);
                          },
                          child:
                  Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          right: Dimensions.width10,
                          left: Dimensions.width10),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                      child:  BigText(
                            text: '\$ ${product.price!}|Add to card',
                            size: Dimensions.font17,
                          ))),
                ],
              ),
            );
          },
        ));
  }
}
