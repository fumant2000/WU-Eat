import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmchat/models/cart-model.dart';
import 'package:tmchat/utils/app-constants.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  //convert to string because sharedpreference only take the string
  void addToCartList(List<CartModel> cartList) {
    cart = [];

    cartList.forEach((element) => cart.add(jsonEncode(element)));
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    List<CartModel> getCartList() {
      List<String>? carts;
      if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
        carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      }
      List<CartModel> cartList = [];

      carts!.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

      return cartList;
    }
  }
}
