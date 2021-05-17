import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/authentication/AuthenticationScreen/authentication_widgets.dart';
import 'package:provider/provider.dart';

import 'login_screen_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Provider.of<LoginWidgets>(context, listen: false).emailController.clear();
    Provider.of<LoginWidgets>(context, listen: false).passwordController.clear();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Provider.of<LoginWidgets>(context, listen: false).emailController.clear();
        Provider.of<LoginWidgets>(context, listen: false).passwordController.clear();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Provider.of<AuthenticationWidgets>(context, listen: false)
                      .selectLanguage(context),
                  Provider.of<AuthenticationWidgets>(context, listen: false)
                      .mainText(context),
                  Provider.of<LoginWidgets>(context, listen: false)
                      .loginForm(context),
                  Provider.of<LoginWidgets>(context, listen: false)
                      .getHelp(context),
                  Provider.of<LoginWidgets>(context, listen: false)
                      .orDivider(context),
                  Provider.of<LoginWidgets>(context, listen: false)
                      .facebookLoginButton(context),
                  Provider.of<LoginWidgets>(context, listen: false)
                      .signUpButton(context),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
