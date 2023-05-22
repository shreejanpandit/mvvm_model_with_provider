import 'package:flutter/foundation.dart';
import 'package:mvvm_practisce_with_provider/data/response/api_response.dart';
import 'package:mvvm_practisce_with_provider/models/movies_model.dart';
import 'package:mvvm_practisce_with_provider/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();
  setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMoviesListApi().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
