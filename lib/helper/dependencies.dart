

import 'package:get/get.dart';
import 'package:tmchat/controllers/popular-product-controller.dart';
import 'package:tmchat/data/api/api-client.dart';
import 'package:tmchat/data/repository/popular-product-repo.dart';
import 'package:tmchat/utils/app-constants.dart';

Future<void> init()async {
  //ApiClient
Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

//PopularProductRepo
Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
//popularProductController

Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));


}