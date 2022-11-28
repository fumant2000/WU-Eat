import 'package:get/get.dart';
import 'package:tmchat/pages/cart/cart-page.dart';
import 'package:tmchat/pages/food/popular-food-details.dart';
import 'package:tmchat/pages/food/recommanded-foods-details.dart';
import 'package:tmchat/pages/home/home-page.dart';
import 'package:tmchat/pages/home/main-foods-page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';

  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';

  static String getCartPage() => '$cartPage';



  static List<GetPage> routes = [

    GetPage(name: '/', page: () => HomePage()),
    
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularFoodsPage(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),

    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
           var page = Get.parameters['page'];
          return RecommendedFoodsPage(
            pageId: int.parse(pageId!),
            page: page!
          );
        },
        transition: Transition.fadeIn),

    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn)



  ];
}
