import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/screens/authentication/createNewAccount/createNewAccountScreen.dart';
import 'package:instagram_clone/services/FirebaseAuth.dart';

import 'package:provider/provider.dart';

import 'login_utils.dart';

class LoginWidgets with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ConstantColors constantColors = ConstantColors();
  final formKey = GlobalKey<FormState>();

  loginForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              width: 300.w,
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value.isEmpty){
                    return 'Email address cannot be empty.';
                  }
                  return null;
                },
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(0.35),
                  filled: true,
                  hintText: 'Phone number, email or username',
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  border: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              width: 300.w,
              child: TextFormField(
                controller: passwordController,
                obscureText:
                    Provider.of<LoginUtils>(context, listen: true).isObscure,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Password cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.35),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Provider.of<LoginUtils>(context, listen: true).isObscure
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      color: Colors.white54,
                      size: 15.sp,
                    ),
                    onTap: () {
                      Provider.of<LoginUtils>(context, listen: false)
                          .changeVisibility(context);
                    },
                  ),
                  border: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: GestureDetector(
                child: Container(
                  height: 45.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: constantColors.blueColor,
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if(formKey.currentState.validate()){
                   Provider.of<FirebaseAuthentication>(context, listen: false).loginUser(context, emailController.text, passwordController.text);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getHelp(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Forgot your login details?',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            ' Get help logging in.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  orDivider(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 0.h),
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

  facebookLoginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: GestureDetector(
        child: Container(
          height: 45.h,
          width: 330.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.facebook,
                color: constantColors.blueColor,
                size: 19.sp,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'Log in with Facebook',
                style: TextStyle(
                  color: constantColors.blueColor,
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

  signUpButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45.h),
      child: GestureDetector(
        onTap: (){
          print('Navigate to create account screen');
          Navigator.push(context, MaterialPageRoute(builder: (_) => CreateNewAccountScreen()),);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(color: Colors.white54),
            ),
            Text(
              ' Sign up.',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

}
