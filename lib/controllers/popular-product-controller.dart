import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchat/controllers/cart-controller.dart';
import 'package:tmchat/data/repository/popular-product-repo.dart';
import 'package:tmchat/models/cart-model.dart';
import 'package:tmchat/models/products-models.dart';
import 'package:tmchat/utils/colors.dart';

class PopularProductController extends GetxController {

  final PopularProductRepo popularProductRepo;

PopularProductController({ required this.popularProductRepo});
List<ProductModel> _popularProductList=[];
List<ProductModel> get popularProductList =>_popularProductList;
late CartController _cart;

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
  if ((_inCartItems+ quantity)<0){
    Get.snackbar('Item Count', 'You can reduce more',
    backgroundColor: AppColors.mainColor,
    colorText: Colors.white,
    );
    if(_inCartItems>0){
      quantity= -_inCartItems;
      return _quantity;
    }
    return 0;
  }else if((_inCartItems+quantity)>20){
    Get.snackbar('Item Count', 'You can add more',
    backgroundColor: AppColors.mainColor,
    colorText: Colors.white,
    );
    return 20;
  }else{
    return quantity;
  }

 }
 void initProduct(ProductModel product, CartController cart){
  _quantity=0;
  _inCartItems=0;
  _cart= cart;
  var exist=false;
  exist= _cart.existInCart(product);
  print('exist or not '+ exist.toString());
  //if exixt
  //get from strorage _inCartItems
  if (exist){
    _inCartItems=_cart.getQuantity(product);
  }
  print('the quantity in the cart is' + _inCartItems.toString());
 }
void addItems(ProductModel product){
 _cart.addItems(product, _quantity);
 _quantity=0;
 _inCartItems=_cart.getQuantity(product);
 _cart.items.forEach((key, value) {
  print('the id is '+ value.id.toString()+' and the quantity is '+  value.quantity.toString());
  });
 update();
  
}

int get totalItems{
  return _cart.totalItems;
}

List<CartModel> get getItems{
  return _cart.getItems;
}

}