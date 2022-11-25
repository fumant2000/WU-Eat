import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchat/controllers/popular-product-controller.dart';
import 'package:tmchat/controllers/recommended-product-controller.dart';
import 'package:tmchat/models/products-models.dart';
import 'package:tmchat/pages/food/popular-food-details.dart';
import 'package:tmchat/pages/food/recommanded-foods-details.dart';
import 'package:tmchat/routes/routes-helper.dart';
import 'package:tmchat/utils/app-constants.dart';
import 'package:tmchat/utils/colors.dart';
import 'package:tmchat/utils/dimensions.dart';
import 'package:tmchat/widgets/app-column.dart';
import 'package:tmchat/widgets/big-text.dart';
import 'package:tmchat/widgets/icon-and-text-widget.dart';
import 'package:tmchat/widgets/small-text.dart';

class FoodsPageBody extends StatefulWidget {
  FoodsPageBody({Key? key}) : super(key: key);

  @override
  State<FoodsPageBody> createState() => _FoodsPageBodyState();
}

class _FoodsPageBodyState extends State<FoodsPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPageValue = 0.0;
  double scaleFactor = 0.8;
  double _height = Get.height * 0.28;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
        //print('currentState is' + currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return popularProduct.isLoaded
              ? Container(
                  height: Dimensions.pageView,
                  //Get.height * 0.45,
                  //padding: EdgeInsets.all(10) ,

                  //color: Colors.redAccent,
                  
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: popularProduct.popularProductList.length,
                        itemBuilder: (context, position) {
                          return _buildPageItem(position,
                              popularProduct.popularProductList[position]);
                        }),
                  
                )
              : CircularProgressIndicator(color: AppColors.mainColor);
        }),
        SizedBox(
          height: Dimensions.height10,
        ),
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return DotsIndicator(
            dotsCount: popularProduct.popularProductList.isEmpty
                ? 1
                : popularProduct.popularProductList.length,
            position: currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //dots

        //popular text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width15),
                child: BigText(text: 'Recommended'),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallTetxt(
                  text: 'Food pairing',
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        //list of image an foofs
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getRecommendedFood(index));
                    },
                       child:
                    Container(
                      margin: EdgeInsets.only(
                          right: Dimensions.width10,
                          left: Dimensions.width10,
                          bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          //imageSection
                           Container(
                              height: Dimensions.listViewImgSize,
                              width: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          AppConstants.BASE_URL +
                                              AppConstants.UPLOAD_URL +
                                              recommendedProduct
                                                  .recommendedProductList[index]
                                                  .img!)
                                      //AssetImage('assets/images/hambuger.png')
                                      )),
                            ),
                            //text Container
                          
                          Expanded(
                            child: Container(
                                //height: Dimensions.listViewTextSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius20)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.width15,
                                      right: Dimensions.width15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                          text: recommendedProduct
                                              .recommendedProductList[index]
                                              .name!),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      SmallTetxt(
                                          text:
                                              'with the Camerounian caracteristik'),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconAndTextWidget(
                                              icon: Icons.circle_sharp,
                                              text: 'Normal',
                                              iconColor: AppColors.iconColor1),
                                          IconAndTextWidget(
                                              icon: Icons.location_on,
                                              text: '1.7Km',
                                              iconColor: AppColors.mainColor),
                                          IconAndTextWidget(
                                              icon: Icons.access_time_outlined,
                                              text: '35min',
                                              iconColor: AppColors.iconColor2)
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                    ));
                  })
              : CircularProgressIndicator(color: AppColors.mainColor);
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == currPageValue.floor()) {
      var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (currPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() - 1) {
      var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
         GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getPopularFood(index));
                    },
          child: Container(
              height: Dimensions.pageViewContainer,
              //Get.height * 0.35,
              margin: EdgeInsets.only(
                right: Get.width * 0.008,
                left: Get.width * 0.008,
              ),
              decoration: BoxDecoration(
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.BASE_URL +
                          AppConstants.UPLOAD_URL +
                          popularProduct.img!)
                      //AssetImage('assets/images/poulet1.jpeg')
                      ))),
            ),
          
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                //Get.height * 0.15,
                margin: EdgeInsets.only(
                    right: Dimensions.width15,
                    left: Dimensions.width15,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        blurRadius: 1,
                        offset: Offset(0, 3),
                      ),
                      BoxShadow(
                        color: Colors.grey.shade100,
                        blurRadius: 1,
                        offset: Offset(-3, 0),
                      ),
                      BoxShadow(
                        color: Colors.grey.shade100,
                        blurRadius: 1,
                        offset: Offset(3, 0),
                      )
                    ]),
                child: Container(
                  padding: EdgeInsets.only(
                    right: Dimensions.width15,
                    left: Dimensions.width15,
                    top: Dimensions.height15,
                  ),
                  child: AppColumn(text: popularProduct.name!),
                ),
              ))
        ],
      ),
    );
  }
}
