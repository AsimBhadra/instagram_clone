import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/screens/authentication/namePasswordScreen/name_password_screen.dart';
import 'package:instagram_clone/screens/authentication/otpScreen/otp_screen.dart';

import 'package:instagram_clone/support/country_code.dart';

import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'createAccountUtil.dart';

class CreateNewAccountWidget with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController searchTextController = TextEditingController();
  ConstantColors constantColors = ConstantColors();
  var dropdownValue = {"name": "Nepal", "dial_code": "+977", "code": "NP"};
  List searchList = [];
  String errorMsgPhone = '';
  String errorMsgEmail = '';

  mainLogo(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.w, color: Colors.white)),
        child: Icon(
          LineIcons.userAlt,
          color: Colors.white,
          size: 100.sp,
        ),
      ),
    );
  }

  registration(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  Text(
                    'PHONE',
                    style: TextStyle(
                      color:
                          Provider.of<CreateAccountUtil>(context, listen: true)
                                      .selectedMethod ==
                                  'Phone'
                              ? Colors.white
                              : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 2.h,
                    width: 150.w,
                    color: Provider.of<CreateAccountUtil>(context, listen: true)
                                .selectedMethod ==
                            'Phone'
                        ? Colors.white
                        : Colors.grey,
                  ),
                ],
              ),
            ),
            onTap: () {
              Provider.of<CreateAccountUtil>(context, listen: false)
                  .changeMethodPhone(context);
            },
          ),
          GestureDetector(
            child: Container(
              child: Column(
                children: [
                  Text(
                    'EMAIL',
                    style: TextStyle(
                      color:
                          Provider.of<CreateAccountUtil>(context, listen: true)
                                      .selectedMethod ==
                                  'Email'
                              ? Colors.white
                              : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 2.h,
                    width: 150.w,
                    color: Provider.of<CreateAccountUtil>(context, listen: true)
                                .selectedMethod ==
                            'Email'
                        ? Colors.white
                        : Colors.grey,
                  ),
                ],
              ),
            ),
            onTap: () {
              Provider.of<CreateAccountUtil>(context, listen: false)
                  .changeMethodEmail(context);
            },
          ),
        ],
      ),
    );
  }

  phoneRegistration(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.35),
              borderRadius: BorderRadius.circular(6.sp),
              border: Border.all(
                width: 1.sp,
                color:
                    Provider.of<CreateNewAccountWidget>(context, listen: true)
                            .errorMsgPhone
                            .isNotEmpty
                        ? Colors.red
                        : Colors.black,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                countryCode(context),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    height: 22.h,
                    width: 2.w,
                    color: Colors.black45,
                  ),
                ),
                Container(
                  height: 38.h,
                  width: 205.w,
                  child: Form(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Phone',
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 13.sp,
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
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 300.w,
            child: Text(
              Provider.of<CreateNewAccountWidget>(context, listen: true)
                  .errorMsgPhone,
              style: TextStyle(color: Colors.red, fontSize: 11.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'You may receive SMS updates from Instagram and can opt out at any time.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Consumer<CreateAccountUtil>(
            builder: (context, createAccountUtil, _) {
              return createAccountUtil.phoneLoading
                  ? Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: GestureDetector(
                        child: Consumer<CreateAccountUtil>(
                          builder: (context, createAccountUtil, _) {
                            return Container(
                              height: 45.h,
                              width: 330.w,
                              decoration: BoxDecoration(
                                color: constantColors.blueColor,
                                borderRadius: BorderRadius.circular(5.sp),
                              ),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        onTap: () {
                          if (numberController.text.isEmpty) {
                            print(Provider.of<CreateNewAccountWidget>(context,
                                    listen: false)
                                .errorMsgPhone);
                            Provider.of<CreateNewAccountWidget>(context,
                                        listen: false)
                                    .errorMsgPhone =
                                'Phone number cannot be empty.';
                            notifyListeners();
                            print(Provider.of<CreateNewAccountWidget>(context,
                                    listen: false)
                                .errorMsgPhone);
                          }
                          if (numberController.text.length < 9) {
                            print(Provider.of<CreateNewAccountWidget>(context,
                                    listen: false)
                                .errorMsgPhone);
                            Provider.of<CreateNewAccountWidget>(context,
                                        listen: false)
                                    .errorMsgPhone =
                                'Looks like your phone number may be incorrect. Please try entering your full number, including the country code.';
                            notifyListeners();
                          } else {
                            Provider.of<CreateAccountUtil>(context,
                                    listen: false)
                                .phoneLoading = true;
                            notifyListeners();
                            Future.delayed(Duration(seconds: 2), () {
                              print("Navigating to name and password screen");
                              Provider.of<CreateAccountUtil>(context,
                                  listen: false)
                                  .phoneLoading = false;
                              notifyListeners();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NamePasswordScreen(
                                  otpTo: dropdownValue["dial_code"] + numberController.text,
                                  method: 'Phone',
                                )),
                              );
                            });
                          }
                        },
                      ),
                    );
            },
          )
        ],
      ),
    );
  }

  emailRegistration(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.35),
              borderRadius: BorderRadius.circular(6.sp),
              border: Border.all(
                width: 1.sp,
                color:
                    Provider.of<CreateNewAccountWidget>(context, listen: true)
                            .errorMsgEmail
                            .isNotEmpty
                        ? Colors.red
                        : Colors.black,
              ),
            ),
            child: Container(
              height: 38.h,
              width: 120.w,
              padding: EdgeInsets.only(left: 20.w),
              child: Form(
                key: formKey,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onTap: () {
                        emailController.clear();
                      },
                    ),
                    hintText: 'Email',
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
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 300.w,
            child: Text(
              Provider.of<CreateNewAccountWidget>(context, listen: true)
                  .errorMsgEmail,
              style: TextStyle(color: Colors.red, fontSize: 11.sp),
            ),
          ),
          Consumer<CreateAccountUtil>(
            builder: (context, createAccountUtil, _){
              return createAccountUtil.emailLoading ? Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: CircularProgressIndicator(),
              ) : Padding(
                padding: EdgeInsets.only(top: 15.h),
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
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (emailController.text.isEmpty) {
                      print(Provider.of<CreateNewAccountWidget>(context,
                          listen: false)
                          .errorMsgEmail);
                      Provider.of<CreateNewAccountWidget>(context, listen: false)
                          .errorMsgEmail = 'Email cannot be empty.';
                      notifyListeners();
                      print(Provider.of<CreateNewAccountWidget>(context,
                          listen: false)
                          .errorMsgEmail);
                    } else {
                      Provider.of<CreateAccountUtil>(context,
                          listen: false)
                          .emailLoading = true;
                      notifyListeners();
                      Future.delayed(Duration(seconds: 2), () {
                        print("Navigating to name and password screen");
                        Provider.of<CreateAccountUtil>(context,
                            listen: false)
                            .emailLoading = false;
                        notifyListeners();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NamePasswordScreen(
                            otpTo: emailController.text,
                            method: 'Email',
                          )),
                        );
                      });
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  countryCode(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              Provider.of<CreateNewAccountWidget>(context, listen: true)
                      .dropdownValue['dial_code'] +
                  ' ' +
                  Provider.of<CreateNewAccountWidget>(context, listen: true)
                      .dropdownValue['code'],
              style: TextStyle(
                  color: Colors.white.withOpacity(0.75),
                  fontWeight: FontWeight.bold),
            ),
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
                    'SELECT YOUR COUNTRY',
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
                              'hre',
                              // Provider.of<CreateNewAccountWidget>(context,
                              //         listen: false)
                              //     .dropdownValue,
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
                        Consumer<CreateNewAccountWidget>(
                            builder: (_, createNewAccountWidgets, __) {
                          return Container(
                            height: 425.h,
                            width: 200.w,
                            child: ListView.builder(
                              itemCount:
                                  createNewAccountWidgets.searchList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: GestureDetector(
                                    onTap: () {
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
                                                    createNewAccountWidgets
                                                                .searchList[
                                                            index]["name"] +
                                                        ' (${createNewAccountWidgets.searchList[index]["code"]})',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  Text(
                                                    createNewAccountWidgets
                                                            .searchList[index]
                                                        ["dial_code"],
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
                                              // createNewAccountWidgets.searchList[index]
                                              // ["name"] ==
                                              //     Provider.of<CreateNewAccountWidget>(
                                              //         context,
                                              //         listen: false)
                                              //         .dropdownValue
                                              //     ? Icon(
                                              //   Icons.check,
                                              //   color: Colors.blueAccent,
                                              // )
                                              //     : Text(''),
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
            );
          },
        ),
      ],
    );
  }

  searchData(BuildContext context, String query) {
    if (query.isEmpty) {
      Provider.of<CreateNewAccountWidget>(context, listen: false).searchList =
          countries;
      notifyListeners();
    } else {
      for (var i = 0; i < countries.length; i++) {
        String countryName = countries[i]["name"];
        if (countryName.toLowerCase().contains(query)) {
          Provider.of<CreateNewAccountWidget>(context, listen: false)
              .searchList
              .add(countries[i]);
        }
      }
      notifyListeners();
    }
  }
}
