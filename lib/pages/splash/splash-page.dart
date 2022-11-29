import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchat/controllers/popular-product-controller.dart';
import 'package:tmchat/controllers/recommended-product-controller.dart';
import 'package:tmchat/routes/routes-helper.dart';
import 'package:tmchat/utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  _loadRessource()async{
 await Get.find<PopularProductController>().getPopularProductList();
  await   Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadRessource();
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 2))..forward();
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(Duration(seconds:3), ()=>Get.offAllNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
          scale: animation,
          child: Center(
            child: Image.asset('assets/images/fast-food-hamburger.png', width: Dimensions.splashImg,)
          )
        ),
        Center(
            child: Image.asset('assets/images/good-food-text-word.jpg', width: Dimensions.splashImg,)
          )
        ],
      ),
    );
  }
}
