import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'otp_utils.dart';
import 'otp_widgets.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({Key key, @required this.otpTo, @required this.method})
      : super(key: key);
  final String otpTo;
  final String method;
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  ConstantColors constantColors = ConstantColors();
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      Provider.of<OTPUtils>(context, listen: false).makeInvalid(context);
    });
    Provider.of<OTPWidgets>(context, listen: false).numberController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (_) => Container(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp)),
              backgroundColor: Color(0xff3a3b3c),
              title: Center(
                child: Text(
                  'You\'re Almost Done',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              content: Text(
                'Are you sure you want to go back?',
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
              actions: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(right: 30.w, bottom: 15.h),
                    child: Text(
                      "Go Back",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(right: 50.w, bottom: 15.h),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: constantColors.blackBackgroundColor,
          body: Column(
            children: [
              Provider.of<OTPWidgets>(context, listen: false).mainText(context),
              Provider.of<OTPWidgets>(context, listen: false)
                  .subTitleText(context, widget.otpTo),
              Provider.of<OTPWidgets>(context, listen: false).otpCode(context),
              Provider.of<OTPWidgets>(context, listen: false)
                  .confirmOTPButton(context, widget.otpTo, widget.method),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Text(
                  'Feature not available yet\nPlease Skip by pressing Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
