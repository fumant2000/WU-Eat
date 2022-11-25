import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchat/data/repository/popular-product-repo.dart';
import 'package:tmchat/models/products-models.dart';
import 'package:tmchat/utils/colors.dart';

class PopularProductController extends GetxController {

  final PopularProductRepo popularProductRepo;

PopularProductController({ required this.popularProductRepo});
List<dynamic> _popularProductList=[];
List<dynamic> get popularProductList =>_popularProductList;

bool _isLoaded = false;
bool get isLoaded=> _isLoaded;
int _quantity=0;
int get quantity=>_quantity;
int _inCartItems=0;
int get inCartItems=> _inCartItems+_quantity;

Future<void> getPopularProductList()async{
  Response response = await popularProductRepo.getPopularProductList();
  if(response.statusCode==200){
    _popularProductList=[];
    _popularProductList.addAll(Product.fromJson(response.body).products);
    _isLoaded=true;
    update();
  }
}

 void setQuantity(bool increment) {
  if(increment){
    _quantity= checkQuantity(_quantity+1);
  }else{
    _quantity= checkQuantity(_quantity-1);
  }
  update();
 }

 int checkQuantity(int quantity){
  if (quantity<0){
    Get.snackbar('Item Count', 'You can reduce more',
    backgroundColor: AppColors.mainColor,
    colorText: Colors.white,
    );
    return 0;
  }else if(quantity>20){
    Get.snackbar('Item Count', 'You can add more',
    backgroundColor: AppColors.mainColor,
    colorText: Colors.white,
    );
    return 20;
  }else{
    return quantity;
  }

 }
 void initProduct(){
  _quantity=0;
  _inCartItems=0;
  //if exixt
  //get from strorage _inCartItems
 }
}