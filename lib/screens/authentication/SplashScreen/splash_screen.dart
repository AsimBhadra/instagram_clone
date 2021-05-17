import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/screens/authentication/AuthenticationScreen/authentication_screen.dart';
import 'package:instagram_clone/screens/homepage/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ConstantColors constantColors = ConstantColors();
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      print('Navigating to auth screen');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthenticationScreen()),);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: constantColors.darkBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 65.h,
                width: 65.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 275.h,
              ),
              Container(
                child: Text(
                  'from',
                  style: TextStyle(
                    fontFamily: 'Sebino',
                    fontSize: 18.sp,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
              Container(
                child: GradientText("FACEBOOK",
                  style: TextStyle(
                        fontFamily: 'Mrs Onion',
                        fontSize: 17.sp,
                      ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xffe19740),
                        Color(0xffFD1D1D),
                        Color(0xff8134AF),
                      ],
                    ),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
