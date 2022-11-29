

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmchat/controllers/cart-controller.dart';
import 'package:tmchat/controllers/popular-product-controller.dart';
import 'package:tmchat/controllers/recommended-product-controller.dart';
import 'package:tmchat/data/api/api-client.dart';
import 'package:tmchat/data/repository/cart-repo.dart';
import 'package:tmchat/data/repository/popular-product-repo.dart';
import 'package:tmchat/data/repository/recommended-product-repo.dart';
import 'package:tmchat/utils/app-constants.dart';

Future<void> init()async {

final sharedPreferences= await SharedPreferences.getInstance();

  //ApiClient
Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));
Get.lazyPut(() => sharedPreferences);

//Reposirory
Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
Get.lazyPut(()=>RecommendedProductRepo(apiClient: Get.find()));
Get.lazyPut(()=>CartRepo(sharedPreferences: Get.find()));



//Controller
Get.lazyPut(()=>CartController(cartRepo: Get.find()));
Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
Get.lazyPut(()=>RecommendedProductController(recommendedProductRepo: Get.find()));


}