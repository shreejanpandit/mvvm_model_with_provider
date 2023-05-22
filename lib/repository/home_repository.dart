import 'package:mvvm_practisce_with_provider/data/network/base_api_service.dart';
import 'package:mvvm_practisce_with_provider/data/network/network_api_service.dart';
import 'package:mvvm_practisce_with_provider/models/movies_model.dart';
import 'package:mvvm_practisce_with_provider/res/app_urls.dart';

class HomeRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<MovieListModel> fetchMoviesListApi() async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse(AppUrl.moviesListUrl);

      return MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
