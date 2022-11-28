import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchat/controllers/cart-controller.dart';
import 'package:tmchat/controllers/popular-product-controller.dart';
import 'package:tmchat/controllers/recommended-product-controller.dart';
import 'package:tmchat/pages/home/main-foods-page.dart';
import 'package:tmchat/routes/routes-helper.dart';
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
                      Get.toNamed(RouteHelper.getInitial());
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
                      child: GetBuilder<CartController>(
                        builder: (cartController) {
                          var _cartlist = cartController.getItems;
                          return ListView.builder(
                              itemCount: _cartlist.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  height: Dimensions.height20 * 5,
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          var popularIndex = Get.find<
                                                  PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartlist[index].product!);
                                          if (popularIndex >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getPopularFood(
                                                    popularIndex, 'cartpage'));
                                          } else {
                                            var recommendedIndex = Get.find<
                                                    RecommendedProductController>()
                                                .recommendedProductList
                                                .indexOf(
                                                    _cartlist[index].product!);
                                            Get.toNamed(
                                                RouteHelper.getRecommendedFood(
                                                    recommendedIndex,
                                                    'cartpage'));
                                          }
                                        },
                                        child: Container(
                                          height: Dimensions.height20 * 5,
                                          width: Dimensions.height20 * 5,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      AppConstants.BASE_URL +
                                                          AppConstants
                                                              .UPLOAD_URL +
                                                          cartController
                                                              .getItems[index]
                                                              .img!))),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width10,
                                      ),
                                      Expanded(
                                          child: Container(
                                              child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BigText(
                                            text: cartController
                                                .getItems[index].name!,
                                            color: Colors.black54,
                                          ),
                                          SmallTetxt(text: 'Spicy'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                text: '\$ ' +
                                                    cartController
                                                        .getItems[index].price!
                                                        .toString(),
                                                color: Colors.blue[800],
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: Dimensions.height10,
                                                    bottom: Dimensions.height10,
                                                    right: Dimensions.width10,
                                                    left: Dimensions.width10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius20)),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        cartController.addItems(
                                                            _cartlist[index]
                                                                .product!,
                                                            -1);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color:
                                                            AppColors.signColor,
                                                        size: Dimensions.font17,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Dimensions.width10,
                                                    ),
                                                    BigText(
                                                      text: _cartlist[index]
                                                          .quantity
                                                          .toString(),
                                                      // populaProduct.inCartItems.toString(),
                                                      color:
                                                          AppColors.signColor,
                                                      size: Dimensions.font17,
                                                    ),
                                                    SizedBox(
                                                      width: Dimensions.width10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        cartController.addItems(
                                                            _cartlist[index]
                                                                .product!,
                                                            1);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        color:
                                                            AppColors.signColor,
                                                        size: Dimensions.font17,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )))
                                    ],
                                  ),
                                );
                              });
                        },
                      ))))
        ]),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (cartController) {
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
                    
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        BigText(
                          text:"\$ "+ cartController.totalAmount.toString(),
                          color: AppColors.signColor,
                          size: Dimensions.font17,
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),

                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        //populaProduct.addItems(product);
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                              top: Dimensions.height20,
                              bottom: Dimensions.height20,
                              right: Dimensions.width10,
                              left: Dimensions.width10),
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20)),
                          child: BigText(
                            text: 'Check Out',
                            size: Dimensions.font17,
                          ))),
                ],
              ),
            );
          },
        ));
  }
}
