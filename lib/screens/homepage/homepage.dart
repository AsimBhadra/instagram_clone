import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: constantColors.blackBackgroundColor,
          body: Column(
            children: [
            ],
          ),
        ),
      ),
    );
  }
}
