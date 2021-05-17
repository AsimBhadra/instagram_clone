import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/authentication/AuthenticationScreen/authentication_widgets.dart';
import 'package:instagram_clone/support/country_code.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'createAccountUtil.dart';
import 'createNewAccountWidgets.dart';

class CreateNewAccountScreen extends StatefulWidget {
  const CreateNewAccountScreen({Key key}) : super(key: key);
  @override
  _CreateNewAccountScreenState createState() => _CreateNewAccountScreenState();
}

class _CreateNewAccountScreenState extends State<CreateNewAccountScreen> {
  @override
  void initState() {
    Provider.of<CreateNewAccountWidget>(context, listen: false).searchList =
        countries;
    Provider.of<CreateAccountUtil>(context, listen: false).phoneLoading = false;
    Provider.of<CreateAccountUtil>(context, listen: false).emailLoading = false;
    Provider.of<CreateNewAccountWidget>(context, listen: false).emailController.clear();
    Provider.of<CreateNewAccountWidget>(context, listen: false).numberController.clear();
    Provider.of<CreateNewAccountWidget>(context, listen: false).searchTextController.clear();
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
                  'Discard Info?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              content: Text(
                'If you go back now, any\ninformation you\'ve entered so\nfar will be discarded.',
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
              actions: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(right: 30.w , bottom: 15.h),
                    child: Text(
                      "Discard",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: (){
                    Navigator.pop(context);
                    Provider.of<CreateNewAccountWidget>(context, listen: false).errorMsgPhone = '';
                    Provider.of<CreateNewAccountWidget>(context, listen: false).errorMsgEmail= '';
                    Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(right: 50.w , bottom: 15.h),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: (){
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
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100.h,),
                Provider.of<CreateNewAccountWidget>(context, listen: false)
                    .mainLogo(context),
                Provider.of<CreateNewAccountWidget>(context, listen: false)
                    .registration(context),
                Provider.of<CreateAccountUtil>(context, listen: true).selectedMethod == 'Phone' ?
                Provider.of<CreateNewAccountWidget>(context, listen: false)
                    .phoneRegistration(context) : Provider.of<CreateNewAccountWidget>(context, listen: false)
                    .emailRegistration(context),
                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Provider.of<AuthenticationWidgets>(context, listen: false)
                      .loginSecondaryButton(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
