import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/screens/authentication/namePasswordScreen/name_password_screen.dart';
import 'package:provider/provider.dart';

import 'otp_utils.dart';

class OTPWidgets with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  TextEditingController numberController = TextEditingController();

  mainText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 35.h),
      child: Center(
        child: Text(
          'ENTER CONFIRMATION CODE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  subTitleText(BuildContext context, String otpTo) {
    return Padding(
      padding: EdgeInsets.only(top: 35.h),
      child: Center(
        child: Column(
          children: [
            Text(
              'Enter the confirmation code was sent to\n' + otpTo,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Resend Code.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  otpCode(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Container(
        height: 70.h,
        width: 330.w,
        padding: EdgeInsets.only(left: 10.h),
        child: Center(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: numberController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
            ),
            validator: (value) {
              if (value.length < 6) {
                Future.delayed(Duration.zero, () async {
                  Provider.of<OTPUtils>(context, listen: false)
                      .makeInvalid(context);
                });
              }
              if (value.length >= 6) {
                Future.delayed(Duration.zero, () async {
                  Provider.of<OTPUtils>(context, listen: false)
                      .makeValid(context);
                });
              }
              return '';
            },
            decoration: InputDecoration(
              fillColor: Colors.white.withOpacity(0.35),
              filled: true,
              hintText: 'Confirmation Code',
              hintStyle: TextStyle(
                color: Colors.white70,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
              suffixIcon: GestureDetector(
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onTap: () {
                  numberController.clear();
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
      ),
    );
  }

  confirmOTPButton(BuildContext context, String otpTo, String method) {
    return GestureDetector(
      child: Consumer<OTPUtils>(
        builder: (context, otpUtils,_){
          return Container(
            height: 45.h,
            width: 330.w,
            decoration: BoxDecoration(
              color: otpUtils.isValid ? constantColors.blueColor: Color(0xff002E4A),
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
          );
        },
      ),
      onTap: (){
        print('Navigate to name and password screen');
        Navigator.push(context, MaterialPageRoute(builder: (_) => NamePasswordScreen(
          otpTo: otpTo,
          method: method,
        )),);

      },
    );
  }
}
