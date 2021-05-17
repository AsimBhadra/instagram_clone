import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/support/languages.dart';

import 'package:provider/provider.dart';

import 'authentication_widgets.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key key}) : super(key: key);
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  ConstantColors constantColors = ConstantColors();
  bool facebookInstalled = false;
  @override
  void initState() {
    Provider.of<AuthenticationWidgets>(context, listen: false).searchList = languages;
    Provider.of<AuthenticationWidgets>(context, listen: false).searchTextController.clear();
    facebookInstallCheck(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: constantColors.blackBackgroundColor,
        body: facebookInstalled ? SingleChildScrollView(
          child: Column(
            children: [
              Provider.of<AuthenticationWidgets>(context, listen: false)
                  .selectLanguage(context),
              Provider.of<AuthenticationWidgets>(context, listen: false)
                  .mainText(context),
              Provider.of<AuthenticationWidgets>(context, listen: false)
                  .facebookLoginButton(context),
              Provider.of<AuthenticationWidgets>(context, listen: false)
                  .orDivider(context),
              Provider.of<AuthenticationWidgets>(context, listen: false)
                  .signUpButton(context),
              Provider.of<AuthenticationWidgets>(context, listen: false)
                  .loginSecondaryButton(context),
            ],
          ),
        ) : SingleChildScrollView(
          child: Column(
            children: [
              Provider.of<AuthenticationWidgets>(context, listen: false)
                  .selectLanguage(context),
              Provider.of<AuthenticationWidgets>(context, listen: false)
                  .mainText(context),
              Provider.of<AuthenticationWidgets>(context, listen: false)
                  .createAccountButton(context),
              Provider.of<AuthenticationWidgets>(context, listen: false)
                  .loginButton(context),
            ],
          ),
        ),
      ),
    );
  }
  facebookInstallCheck(BuildContext context)async{
      bool installed = await  DeviceApps.isAppInstalled('com.facebook.katana');
      setState(() {
        if(installed){
          print('Facebook installation detected');
        }
        else{
          print('No Facebook installation detected');
        }
        facebookInstalled = installed;
      });
  }
}
