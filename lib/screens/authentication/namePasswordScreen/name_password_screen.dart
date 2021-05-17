import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/screens/authentication/namePasswordScreen/name_password_utils.dart';
import 'package:instagram_clone/services/FirebaseOperations.dart';
import 'package:provider/provider.dart';

import 'name_password_helpers.dart';

class NamePasswordScreen extends StatefulWidget {
  NamePasswordScreen({Key key, @required this.otpTo, @required this.method})
      : super(key: key);
  final String otpTo;
  final String method;
  @override
  _NamePasswordScreenState createState() => _NamePasswordScreenState();
}

class _NamePasswordScreenState extends State<NamePasswordScreen> {
  ConstantColors constantColors = ConstantColors();
  @override
  void initState() {
    Provider.of<NamePasswordHelpers>(context, listen: false)
        .nameController
        .clear();
    Provider.of<NamePasswordHelpers>(context, listen: false)
        .usernameController
        .clear();
    Provider.of<NamePasswordHelpers>(context, listen: false)
        .passwordController
        .clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: constantColors.blackBackgroundColor,
        body:  Column(
          children: [
            Provider.of<NamePasswordHelpers>(context, listen: false)
                .mainText(context),
            Provider.of<NamePasswordHelpers>(context, listen: false)
                .loginForm(context, widget.otpTo, widget.method),
          ],
        ),
      ),
    );
  }
}
