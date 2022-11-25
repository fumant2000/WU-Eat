import 'package:get/get.dart';
import 'package:tmchat/data/api/api-client.dart';
import 'package:tmchat/utils/app-constants.dart';

class RecommendedProductRepo extends GetxService{
    
    final ApiClient apiClient;
    RecommendedProductRepo({required this.apiClient});

   Future<Response> getRecommendedProductList() async{

      return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);

    }
}