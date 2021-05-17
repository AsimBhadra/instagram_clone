import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/screens/authentication/createNewAccount/createNewAccountScreen.dart';
import 'package:instagram_clone/screens/authentication/loginScreen/login_screen.dart';

import 'package:instagram_clone/support/languages.dart';

import 'package:provider/provider.dart';

class AuthenticationWidgets with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  TextEditingController searchTextController = TextEditingController();
  String dropdownValue = 'English';
  List searchList = [];

  mainText(BuildContext context) {
    return Center(
      child: Text(
        'Instagram',
        style: TextStyle(
          fontFamily: 'Billabong',
          fontSize: 45.sp,
          color: Colors.white,
        ),
      ),
    );
  }

  orDivider(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 57.h, bottom: 0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 2.h,
            width: 150.w,
            color: Colors.white24,
          ),
          Text(
            'OR',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 2.h,
            width: 150.w,
            color: Colors.white24,
          ),
        ],
      ),
    );
  }

  createAccountButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70.h),
      child: GestureDetector(
        child: Container(
          height: 45.h,
          width: 330.w,
          decoration: BoxDecoration(
            color: constantColors.blueColor,
            borderRadius: BorderRadius.circular(5.sp),
          ),
          child: Center(
            child: Text(
              'Create New Account',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        onTap: () {
          print('Navigating to Create new account screen');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateNewAccountScreen()),
          );
        },
      ),
    );
  }

  facebookLoginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70.h),
      child: GestureDetector(
        child: Container(
          height: 45.h,
          width: 330.w,
          decoration: BoxDecoration(
            color: constantColors.blueColor,
            borderRadius: BorderRadius.circular(5.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.facebook,
                color: Colors.white,
                size: 19.sp,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Log in with Facebook',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          print('Login with facebook');
          // Navigate to homepage on completion
        },
      ),
    );
  }

  loginButton(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()),);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Text(
          'Log In',
          style: TextStyle(
            color: constantColors.blueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  loginSecondaryButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: GestureDetector(
        onTap: (){
          print('Navigate to login screen');
          Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()),);

          },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(color: Colors.white54),
            ),
            Text(
              ' Log in.',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  signUpButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: GestureDetector(
        onTap: () {
          print('Navigating to create account screen');
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => CreateNewAccountScreen()));
        },
        child: Text(
          'Sign up with email or phone number',
          style: TextStyle(
            color: constantColors.blueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  selectLanguage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 157.h),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Provider.of<AuthenticationWidgets>(context, listen: true)
                  .dropdownValue,
              style: TextStyle(color: Colors.grey, fontSize: 13.sp),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          ],
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => Container(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.sp)),
                backgroundColor: Color(0xff3a3b3c),
                title: Text(
                  'SELECT YOUR LANGUAGE',
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          searchList = [];
                          searchData(context, value);
                          notifyListeners();
                        },
                        controller: searchTextController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 25.sp,
                          ),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                      Container(
                        height: 2.h,
                        width: 200.w,
                        color: Colors.grey.shade500,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            Provider.of<AuthenticationWidgets>(context,
                                    listen: false)
                                .dropdownValue,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.blueAccent,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Consumer<AuthenticationWidgets>(
                          builder: (_, authWidgets, __) {
                        return Container(
                          height: 425.h,
                          width: 200.w,
                          child: ListView.builder(
                            itemCount: authWidgets.searchList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: GestureDetector(
                                  onTap: () {
                                    Provider.of<AuthenticationWidgets>(context,
                                                listen: false)
                                            .dropdownValue =
                                        authWidgets.searchList[index]["name"];
                                    notifyListeners();
                                    print(
                                        'Change language to ${authWidgets.searchList[index]["name"]}');
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  authWidgets.searchList[index]
                                                      ["name"],
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                                Text(
                                                  authWidgets.searchList[index]
                                                      ["nativeName"],
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            authWidgets.searchList[index]
                                                        ["name"] ==
                                                    Provider.of<AuthenticationWidgets>(
                                                            context,
                                                            listen: false)
                                                        .dropdownValue
                                                ? Icon(
                                                    Icons.check,
                                                    color: Colors.blueAccent,
                                                  )
                                                : Text(''),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ).then((value) {
            Provider.of<AuthenticationWidgets>(context, listen: false)
                .searchList = languages;
          });
        },
      ),
    );
  }

  searchData(BuildContext context, String query) {
    if (query.isEmpty) {
      Provider.of<AuthenticationWidgets>(context, listen: false).searchList =
          languages;
      notifyListeners();
    } else {
      for (var i = 0; i < languages.length; i++) {
        String countryName = languages[i]["name"];
        if (countryName.toLowerCase().contains(query)) {
          Provider.of<AuthenticationWidgets>(context, listen: false)
              .searchList
              .add(languages[i]);
        }
      }
      notifyListeners();
    }
  }
}
