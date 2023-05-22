import 'package:flutter/material.dart';
import 'package:mvvm_practisce_with_provider/res/components/round_button.dart';
import 'package:mvvm_practisce_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_practisce_with_provider/utils/utils.dart';
import 'package:mvvm_practisce_with_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text("Login"),
        )),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value) => Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode),
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: ((context, value, child) {
                    return TextFormField(
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: '*',
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                    !_obsecurePassword.value;
                              },
                              child: Icon(_obsecurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined))),
                    );
                  })),
              SizedBox(
                height: height * .05,
                child: RoundButton(
                  title: 'Login',
                  loading: authViewModel.loading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage("Please enter Email", context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Please enter Password", context);
                    } else if (_passwordController.text.length < 7) {
                      Utils.flushBarErrorMessage(
                          "Password must be atleast 8 character", context);
                    } else {
                      Map data = {
                        "email": _emailController.text.toString(),
                        "password": _passwordController.text.toString(),
                      };
                      authViewModel.loginApi(data, context);
                    }
                  },
                ),
              ),
              SizedBox(
                height: height * 0.02,
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.signup);
                    },
                    child: Text("Dont have an account ? SingUP")),
              )
            ],
          ),
        ));
  }
}
