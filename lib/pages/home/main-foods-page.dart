import 'package:flutter/material.dart';

import 'package:tmchat/utils/colors.dart';
import 'package:tmchat/utils/dimensions.dart';
import 'package:tmchat/widgets/big-text.dart';
import 'package:tmchat/widgets/small-text.dart';
import 'package:get/get.dart';

import 'foods-page-body.dart';

class  MainFoodsPage extends StatefulWidget {
  MainFoodsPage({Key? key}) : super(key: key);

  @override
  State<MainFoodsPage> createState() => _MainFoodsPageState();
}

class _MainFoodsPageState extends State<MainFoodsPage> {

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height15 ),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Cameroon',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallTetxt(
                            text: 'Bafoussam',
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Container(
                    height:Dimensions.height40,
                    width:Dimensions.width40,
                    child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child:  FoodsPageBody(),))
         
        ],
      ),
    ));
  }
}
