import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchat/controllers/popular-product-controller.dart';
import 'package:tmchat/data/repository/popular-product-repo.dart';

import 'package:tmchat/pages/Home/main-foods-page.dart';
import 'package:tmchat/pages/food/popular-food-details.dart';
import 'package:tmchat/helper/dependencies.dart' as dep;
import 'package:tmchat/pages/home/foods-page-body.dart';
//import 'package:get/get.dart';
const dGreen= Color(0xFF2ac0a6);
const dWhite= Colors.white;
const dBlack= Colors.black;
Future<void> main()async {
WidgetsFlutterBinding.ensureInitialized();
await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      title: 'PubX_mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainFoodsPage(),
      //MainFoodsPage(),
      //PopularFoodsPage() 
      //MainFoodsPage(),
    );
  }
}

