import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/screens/authentication/AuthenticationScreen/authentication_widgets.dart';
import 'package:instagram_clone/screens/authentication/SplashScreen/splash_screen.dart';
import 'package:instagram_clone/screens/authentication/birthdayScreen/birthdayHelpers.dart';

import 'package:instagram_clone/screens/authentication/createNewAccount/createAccountUtil.dart';
import 'package:instagram_clone/screens/authentication/createNewAccount/createNewAccountWidgets.dart';
import 'package:instagram_clone/screens/authentication/loginScreen/login_screen_widgets.dart';
import 'package:instagram_clone/screens/authentication/loginScreen/login_utils.dart';
import 'package:instagram_clone/screens/authentication/namePasswordScreen/name_password_helpers.dart';
import 'package:instagram_clone/screens/authentication/namePasswordScreen/name_password_utils.dart';
import 'package:instagram_clone/screens/authentication/otpScreen/otp_utils.dart';
import 'package:instagram_clone/screens/authentication/otpScreen/otp_widgets.dart';
import 'package:instagram_clone/screens/homepage/homepage.dart';
import 'package:instagram_clone/services/FirebaseAuth.dart';
import 'package:instagram_clone/services/FirebaseOperations.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationWidgets()),
        ChangeNotifierProvider(create: (_) => CreateNewAccountWidget()),
        ChangeNotifierProvider(create: (_) => CreateAccountUtil()),
        ChangeNotifierProvider(create: (_) => LoginWidgets()),
        ChangeNotifierProvider(create: (_) => LoginUtils()),
        ChangeNotifierProvider(create: (_) => OTPWidgets()),
        ChangeNotifierProvider(create: (_) => OTPUtils()),
        ChangeNotifierProvider(create: (_) => NamePasswordHelpers()),
        ChangeNotifierProvider(create: (_) => NamePasswordUtils()),
        ChangeNotifierProvider(create: (_) => BirthdayHelpers()),
        ChangeNotifierProvider(create: (_) => FirebaseAuthentication()),
        ChangeNotifierProvider(create: (_) => FirebaseOperations()),
        ChangeNotifierProvider(create: (_) => UserData()),
      ],
    );
  }
}
