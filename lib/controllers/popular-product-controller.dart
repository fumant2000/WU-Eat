import 'package:get/get.dart';
import 'package:tmchat/data/repository/popular-product-repo.dart';
import 'package:tmchat/models/products-models.dart';

class PopularProductController extends GetxController {

  final PopularProductRepo popularProductRepo;

PopularProductController({ required this.popularProductRepo});
List<dynamic> _popularProductList=[];
List<dynamic> get popularProductList =>_popularProductList;

Future<void> getPopularProductList()async{
  

  Response response = await popularProductRepo.getPopularProductList();
  if(response.statusCode==200){
    _popularProductList=[];
    _popularProductList.addAll(Product.fromJson(response.body).products);
    update();
  }
}

  
}