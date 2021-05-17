import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/services/FirebaseAuth.dart';
import 'package:instagram_clone/widgets/loadingDialog.dart';
import 'package:instagram_clone/widgets/messageDialog.dart';
import 'package:provider/provider.dart';

import 'name_password_utils.dart';

class NamePasswordHelpers with ChangeNotifier{
  ConstantColors constantColors = ConstantColors();
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  mainText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: Center(
        child: Text(
          'NAME AND PASSWORD',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  loginForm(BuildContext context, String otpTo, String method) {
    RegExp regex = new RegExp(pattern);
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300.w,
              child: TextFormField(
                controller: usernameController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Username cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(0.35),
                  filled: true,
                  hintText: 'Username',
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
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value.isEmpty){
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.35),
                  hintText: 'Full name',
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
                Provider.of<NamePasswordUtils>(context, listen: true).isObscure,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                ),
                validator: (value){
                  if(value.isEmpty){
                    return 'Password cannot be empty';
                  }
                  else if(!regex.hasMatch(value)){
                    return 'Password doesn\'t match requirements.';
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
                      Provider.of<NamePasswordUtils>(context, listen: true).isObscure
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      color: Colors.white54,
                      size: 15.sp,
                    ),
                    onTap: () {
                      Provider.of<NamePasswordUtils>(context, listen: false)
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
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if(formKey.currentState.validate()){
                    if(method == "Email"){
                      showLoadingDialog(context);
                      Provider.of<FirebaseAuthentication>(context, listen: false).registerUserWithEmail(context,otpTo, passwordController.text,usernameController.text,nameController.text);
                      formKey.currentState.reset();
                    }
                  }
                  // print('Navigate to birthday screen');
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => BirthdayScreen()),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}