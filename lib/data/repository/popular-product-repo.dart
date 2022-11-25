import 'package:get/get.dart';
import 'package:tmchat/data/api/api-client.dart';
import 'package:tmchat/utils/app-constants.dart';

class PopularProductRepo extends GetxService{
    
    final ApiClient apiClient;
    PopularProductRepo({required this.apiClient});

   Future<Response> getPopularProductList() async{

      return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);

    }
}