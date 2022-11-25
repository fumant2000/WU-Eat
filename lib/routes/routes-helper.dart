import 'package:get/get.dart';
import 'package:tmchat/pages/food/popular-food-details.dart';
import 'package:tmchat/pages/food/recommanded-foods-details.dart';
import 'package:tmchat/pages/home/main-foods-page.dart';

class RouteHelper{

static const String initial='/';
static const String popularFood='/popular-food';
static const String recommendedFood='/recommended-food';


static String getInitial()=>'$initial';
static String getPopularFood(int pageId)=>'$popularFood?pageId=$pageId';
static String getRecommendedFood(int pageId)=>'$recommendedFood?pageId=$pageId';



static List<GetPage> routes=[
  GetPage(name: '/', page: ()=>MainFoodsPage()),
  GetPage(name: popularFood, page: (){
    var pageId= Get.parameters['pageId'];
   return PopularFoodsPage(pageId: int.parse(pageId!));
    }, transition: Transition.fadeIn),
   GetPage(name: recommendedFood, page: (){
    var pageId= Get.parameters['pageId'];
   return RecommendedFoodsPage(pageId: int.parse(pageId!));
    }, transition: Transition.fadeIn),

];

}