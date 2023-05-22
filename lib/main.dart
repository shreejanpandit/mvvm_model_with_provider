import 'package:flutter/material.dart';
import 'package:mvvm_practisce_with_provider/utils/routes/routes.dart';
import 'package:mvvm_practisce_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_practisce_with_provider/view/login_view.dart';
import 'package:mvvm_practisce_with_provider/view_model/auth_view_model.dart';
import 'package:mvvm_practisce_with_provider/view_model/home_view_model.dart';
import 'package:mvvm_practisce_with_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        // ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
