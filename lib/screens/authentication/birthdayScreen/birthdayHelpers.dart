import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/screens/authentication/welcomeScreen/welcome_screen.dart';

import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class BirthdayHelpers with ChangeNotifier {
  DateTime currentDate = DateTime.now();
  var dateFormat =  DateFormat.yMMMMd();
  ConstantColors constantColors = ConstantColors();

  mainText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 35.h),
      child: Center(
        child: Text(
          'ADD YOUR BIRTHDAY',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  subtitleText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Center(
        child: Text(
          'This won\'t be part of your public profile.\nWhy do I need to provide my birthday?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  birthdayLogo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: Icon(
        LineIcons.birthdayCake,
        size: 100.sp,
        color: Colors.white,
      ),
    );
  }

  dateShower(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDatePicker(context);
      },
      child: Container(
        padding: EdgeInsets.only(top: 12.h,left: 20.w),
        height: 40.h,
        width: 310.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.sp),
          color: Colors.white.withOpacity(0.35),
        ),
        child: Text(
          dateFormat.format(Provider.of<BirthdayHelpers>(context, listen: true).currentDate),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.75),
          ),
        ),
      ),
    );
  }

  showDatePicker(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return CupertinoTheme(
            data: CupertinoThemeData(
              brightness: Brightness.dark,
            ),
            child: Container(
              color: Colors.black87,
              height: MediaQuery.of(context).copyWith().size.height / 3,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: currentDate,
                maximumYear: 2021,
                minimumYear: 1900,
                onDateTimeChanged: (DateTime dateTime){
                  Provider.of<BirthdayHelpers>(context, listen: false).currentDate = dateTime;
                  notifyListeners();
                },
              ),
            ),
          );
        });
  }

  nextButton(BuildContext context) {
    return Padding(
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
          print('Navigate to welcome screen');
          Navigator.push(context, MaterialPageRoute(builder: (_) => WelcomeScreen()),);
        },
      ),
    );
  }
}
