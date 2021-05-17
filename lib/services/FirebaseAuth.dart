import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/screens/authentication/namePasswordScreen/name_password_helpers.dart';
import 'package:instagram_clone/screens/homepage/homepage.dart';
import 'package:instagram_clone/services/FirebaseOperations.dart';
import 'package:instagram_clone/widgets/messageDialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthentication with ChangeNotifier{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  registerUserWithEmail(BuildContext context, String email, String password, String username, String name) async{
    print('Registering new user');
    print('Email: $email');
    try{
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      print('Registration successful');
      print('UID: ${userCredential.user.uid}');
      Provider.of<UserData>(context, listen: false).userCredential = userCredential;
      Provider.of<UserData>(context, listen: false).username = username;
      Provider.of<UserData>(context, listen: false).fullName = name;
      Provider.of<FirebaseOperations>(context, listen: false).createUserCollection(context).whenComplete((){
        print('Navigate to homepage');
        sharedPrefs(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Homepage()),);
      });
    }
    on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      if (e.code == 'network-request-failed') {
        showMessageDialog(context, 'Cannot connect to our servers', e.message);
      } else if (e.code == 'operation-not-allowed') {
        showMessageDialog(context, 'Operation not allowed', e.message);
      } else if (e.code == 'invalid-email') {
        showMessageDialog(context, 'Invalid email', e.message);
      } else if (e.code == 'email-already-in-use') {
        showMessageDialog(context, 'Email is already in use', e.message);
      } else if (e.code == 'internal-error') {
        showMessageDialog(
            context, 'Looks like we\'re having some errors', e.message);
      }
    }



  }

  loginUser(BuildContext context, String email, String password) async{
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      Provider.of<UserData>(context, listen: false).userCredential = userCredential;
      print('Navigate to homepage');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Homepage()),);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      if (e.code == 'user-not-found') {
        showMessageDialog(context, 'User not found', e.message);
      } else if (e.code == 'wrong-password') {
        showMessageDialog(context, 'Wrong password', e.message);
      } else if (e.code == 'network-request-failed') {
        showMessageDialog(context, 'Cannot connect to our servers', e.message);
      } else if (e.code == 'operation-not-allowed') {
        showMessageDialog(context, 'Operation not allowed', e.message);
      } else if (e.code == 'invalid-email') {
        showMessageDialog(context, 'Invalid email', e.message);
      } else if (e.code == 'user-disabled') {
        showMessageDialog(context, 'Your account has been disabled', e.message);
      } else if (e.code == 'internal-error') {
        showMessageDialog(
            context, 'Looks like we\'re having some errors', e.message);
      }
    }
  }

  sharedPrefs(BuildContext context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', Provider.of<UserData>(context, listen: false).userCredential.user.uid);
  }




}