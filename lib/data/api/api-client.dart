
import 'package:get/get.dart';
import 'package:tmchat/utils/app-constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}){
    baseUrl= appBaseUrl;
    timeout= Duration(seconds: 30);
    token=AppConstants.TOKEN;
    _mainHeaders={
      'content-type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }
  Future<Response> getData(String url)async{

    try{
        Response response = await get(url);
        return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }



}