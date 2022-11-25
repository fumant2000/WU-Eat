import 'package:get/get.dart';
import 'package:tmchat/data/repository/recommended-product-repo.dart';
import 'package:tmchat/models/products-models.dart';

class RecommendedProductController extends GetxController {

  final RecommendedProductRepo recommendedProductRepo;

RecommendedProductController({ required this.recommendedProductRepo});
List<dynamic> _recommendedProductList=[];
List<dynamic> get recommendedProductList =>_recommendedProductList;

bool _isLoaded = false;
bool get isLoaded=> _isLoaded;

Future<void> getRecommendedProductList()async{
  

  Response response = await recommendedProductRepo.getRecommendedProductList();
  if(response.statusCode==200){
    _recommendedProductList=[];
    _recommendedProductList.addAll(Product.fromJson(response.body).products);
    _isLoaded=true;
    update();
  }
}

  
}