import 'package:mvvm_practisce_with_provider/data/network/base_api_service.dart';
import 'package:mvvm_practisce_with_provider/data/network/network_api_service.dart';
import 'package:mvvm_practisce_with_provider/res/app_urls.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.loginUrl, data);
      print(response.toString());

      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.registerUrl, data);
      print(response.toString());
      return response;
    } catch (e) {
      throw e;
    }
  }
}
