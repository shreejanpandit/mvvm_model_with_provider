import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_practisce_with_provider/models/user_models.dart';
import 'package:mvvm_practisce_with_provider/repository/auth_repository.dart';
import 'package:mvvm_practisce_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_practisce_with_provider/utils/utils.dart';
import 'package:mvvm_practisce_with_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setloading(true);
    _myRepo.loginApi(data).then((value) {
      setloading(false);
      print(value.toString());
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(token: value['token'].toString()));
      Utils.snackBar('Login sucessful', context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setloading(false);

      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setloading(true);
    // ignore: avoid_single_cascade_in_expression_statements
    _myRepo.signupApi(data)
      ..then((value) {
        setloading(false);

        Utils.snackBar('Register sucessful', context);
        Navigator.pushNamed(context, RoutesName.login);
      }).onError((error, stackTrace) {
        setloading(false);

        Utils.flushBarErrorMessage(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      });
  }
}
